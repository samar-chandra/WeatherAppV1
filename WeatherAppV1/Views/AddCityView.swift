//
//  AddCityView.swift
//  WeatherApp
//
//  Created by Samar Chandra on 15/12/23.
//

import SwiftUI

struct AddCityView: View {
    @State var cityName: String = ""
    @ObservedObject private var model = ContentViewModel(cities: [])
    var body: some View {
        
            TextField("Enter City Name", text: $cityName)
            Button("Add City"){
                model.cities.append(City(name: "Bhubaneshwar", lat: Double(model.cityData?.first?.lat ?? "") ?? 0.0, long: Double((model.cityData?.first?.lon) ?? "") ?? 0.0))
            }
    }
}

#Preview {
    AddCityView(cityName: "Bhubaneshwar")
}
