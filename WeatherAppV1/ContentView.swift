//
//  ContentView.swift
//  WeatherApp
//
//  Created by Samar Chandra on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ContentViewModel()
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("PrimaryColor")
                    .opacity(0.1)
                    .ignoresSafeArea()
                TabView {
                    if model.cities.count != 0 {
                        ForEach(model.cities){ city in
                            CityOverview(city: city.name, time: "10.40 AM", lat: city.lat, long: city.long)
                        }
                    }else {
                        AddCityView(cityName: "")
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
            }
        }
    }
}
#Preview {
    ContentView()
}
