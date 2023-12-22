//
//  CityOverviewModel.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import Foundation
import Combine
import SwiftUI

final class CityOverviewModel: ObservableObject {
    @Published var lat: Double
    @Published var long: Double
    
    @Published var weatherData: WeatherData?
    @Published var temp: Double = 0.0
    @Published var description: String = ""
    @Published var feelsLike: Int = 0
    @Published var pressure: Int = 0
    @Published var humidity: Int = 0
    @Published var windSpeed: Int = 0
    @Published var icon: String = ""
    @Published var hourlyIcon: String = ""
    @Published var hourlyData: [Hourly] = []
    @Published var dailyData: [Daily] = []
    @Published var sunset: Date = Date()
    @Published var sunrise: Date = Date()
    let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "hh:mm a"
        return f
    }()
    let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "MMMM dd"
        f.timeZone = TimeZone(identifier: "UTC")
        return f
    }()
    let smallerDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "dd/MM"
        f.timeZone = TimeZone(identifier: "UTC")
        return f
    }()
    private var cancellables = Set<AnyCancellable>()
    var timer = Timer()
    init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
//        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
//            self.load()
//            })
        load()
    }
    func load(){
        WeatherService.getWeatherData(lat: lat, long: long)
            .receive(on: RunLoop.main)
            .sink { completion in
                            switch completion {
                            case .failure(let err):
                                print("Error is \(err.localizedDescription)")
                            case .finished:
                                print("Finished")
                            }
                        }
                        receiveValue: { weatherData in
                                self.weatherData = weatherData
                                self.icon = weatherData.current?.weather?.first?.icon ?? "10d"
                                self.humidity = weatherData.current?.humidity ?? 0
                                self.temp = weatherData.current?.temp ?? 0.0
                                self.feelsLike = Int(weatherData.current?.feels_like ?? 0) - 273
                                self.pressure = weatherData.current?.pressure ?? 0
                                self.windSpeed = Int(weatherData.current?.wind_speed ?? 0)
                                self.description = weatherData.current?.weather?.first?.description ?? ""
                                self.hourlyData = weatherData.hourly ?? []
                                self.dailyData = weatherData.daily ?? []
                                self.sunset = weatherData.current?.sunset ?? Date()
                                self.sunrise = weatherData.current?.sunrise ?? Date()
                        }
                        .store(in: &cancellables)
//                        .sink { (completion) in
//                            switch completion {
//                            case .failure(let error):
//                                print(error.localizedDescription)
//                                return
//                            case .finished:
//                                return
//                            }
//                        } receiveValue: { (weatherData) in
//                            DispatchQueue.main.async {
//                                self.weatherData = weatherData
//                                self.icon = weatherData.current?.weather?.first?.icon ?? "10d"
//                                self.humidity = weatherData.current?.humidity ?? 0
//                                self.temp = weatherData.current?.temp ?? 0.0
//                                self.feelsLike = weatherData.current?.feels_like ?? 0.0
//                                self.pressure = weatherData.current?.pressure ?? 0
//                                self.windSpeed = weatherData.current?.wind_speed ?? 0
//                                self.description = weatherData.current?.weather?.first?.description ?? ""
//                                self.hourlyData = weatherData.hourly ?? []
//                                
//                            }
//                        }
//                        .store(in: &cancellables)

    }
    func getIconString(iconStr: String) -> String{
        var finalIconString: String = ""
        switch iconStr{
        case "01d":
            finalIconString = "Sunny"
        case "01n":
            finalIconString = "Clear"
        case "02d":
            finalIconString = "PartlyCloudyDay"
        case "02n":
            finalIconString = "PartlyCloudyNight"
        case "03d","03n", "04d","04n":
            finalIconString = "Cloudy"
        case "09d":
            finalIconString = "ModRainSwrsDay"
        case "09n":
            finalIconString = "ModRainSwrsNight"
        case "10d":
            finalIconString = "HeavyRain"
        case "11d","11n":
            finalIconString = "CLoudRainThunder"
        case "13d","13n":
            finalIconString = "Blizzard"
        case "50d","50n":
            finalIconString = "Fog"
        default:
            return iconStr
        }
        return finalIconString
    }
}

