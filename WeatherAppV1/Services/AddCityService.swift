//
//  AddCityService.swift
//  WeatherApp
//
//  Created by Samar Chandra on 15/12/23.
//

import Foundation
import Combine

struct AddCityService {
    static func getCityData(cityName: String) -> AnyPublisher<[CityData], Error> {
        let url = URL(string: "https://geocode.maps.co/search?q=\(cityName)")!
        print(url)
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                    return element.data
                    }
            .decode(type: [CityData].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
