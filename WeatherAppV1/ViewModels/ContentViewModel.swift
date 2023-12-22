//
//  ContentViewModel.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    @Published var cityName: String = ""
    @Published var cities = [City]()
    @Published var cityData: [CityData]?
    init(cities: [City] = [City]()) {
        self.cities = [
            City(name: "Bhubaneshwar", lat: 20.2, long: 85.8),
            City(name: "Bangalore", lat: 12.9, long: 77.5),
            City(name: "Patna", lat: 25.6, long: 85.1)
        ]
        
        load()
    }
    private var cancellables = Set<AnyCancellable>()
    func load(){
        AddCityService.getCityData(cityName: cityName)
            .sink { completion in
                            switch completion {
                            case .failure(let err):
                                print("Error is \(err.localizedDescription)")
                            case .finished:
                                print("Finished")
                            }
                        }
                        receiveValue: { cityData in
                            DispatchQueue.main.async {
                                self.cityData = cityData
                            }
                        }
                        .store(in: &cancellables)
    }
}
