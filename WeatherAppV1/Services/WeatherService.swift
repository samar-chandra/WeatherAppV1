//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import Foundation
import Combine

struct WeatherService {
//    static let shared = WeatherService()
//        
//        private init() {
//            
//        }
//        func getWeatherData(lat:Double, long:Double) -> Future<WeatherData, Error> {
//        var cancellables = Set<AnyCancellable>()
//        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&appid=\(Statics.apiKey)"
//        return Future<WeatherData, Error> { [weak self] promise in
//                    guard let url = URL(string: url) else {
//                        return promise(.failure(NetworkError.invalidURL))
//                    }
//                    print("URL is \(url.absoluteString)")
//                    URLSession.shared.dataTaskPublisher(for: url)
//                        .tryMap() { element -> Data in
//                                guard let httpResponse = element.response as? HTTPURLResponse,
//                                    httpResponse.statusCode == 200 else {
//                                    throw NetworkError.responseError
//                                    }
//                                return element.data
//                        }
//                        .decode(type: WeatherData.self, decoder: JSONDecoder())
//                        .receive(on: RunLoop.main)
//                        .sink(receiveCompletion: { (completion) in
//                            if case let .failure(error) = completion {
//                                switch error {
//                                case let decodingError as DecodingError:
//                                    promise(.failure(decodingError))
//                                case let apiError as NetworkError:
//                                    promise(.failure(apiError))
//                                default:
//                                    promise(.failure(NetworkError.unknown))
//                                }
//                            }
//                        }, receiveValue: { promise(.success($0)) })
//                        .store(in: &cancellables)
//                }
//            }
    static func getWeatherData(lat:Double, long:Double) -> AnyPublisher<WeatherData, Error> {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&unit=standard&appid=\(Statics.apiKey)")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                    return element.data
                    }
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .eraseToAnyPublisher()
    }
}


enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
