//
//  City.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import Foundation

struct City: Identifiable{
    let id = UUID()
    let name: String
    let lat: Double
    let long: Double
    
    init(name: String, lat: Double, long: Double) {
        self.name = name
        self.lat = lat
        self.long = long
    }}
