//
//  Next7DaysView.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import SwiftUI

struct Next7DaysView: View {
    @ObservedObject var model: CityOverviewModel
    @State var city: String
    var body: some View {
            ZStack{
                MovingGradient()
                    .ignoresSafeArea()
                VStack{
                HStack(spacing: 16) {
                    Image(model.getIconString(iconStr: model.weatherData?.current?.weather?.first?.icon ?? "01d"))
                        .resizable()
                        .frame(width: 100, height: 100)
                    VStack {
                        Text("\(model.temp - 273, specifier: "%.1f")°")
                            .font(.system(size: 70))
                        .fontWeight(.bold)
                        Text(model.description.capitalized)
                    }
                }
                .padding()
                .frame(height: 120)
                .background(RoundedRectangle(cornerRadius: 40)
                    .fill(RadialGradient(colors: [Color("PrimaryColor"), Color.white],
                                         center: .center,
                                         startRadius: 1,
                                         endRadius: 200)
                        .opacity(0.6))
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(.white, lineWidth: 5)))
                .padding(.horizontal,10)
                ScrollView {
                    Text(city)
                        .font(.title)
                        .fontWeight(.semibold)
                    VStack{
                        ForEach(model.dailyData, id: \.dt) {
                            forecast in
                            
                            DailyForecastView(date: model.dateFormatter.string(from: forecast.dt ?? Date()), iconString: model.getIconString(iconStr: forecast.weather?.first?.icon ?? "10d"), highTemp: (forecast.temp?.max ?? 0.0) - 273, lowTemp: (forecast.temp?.min ?? 0.0) - 273)
                            Divider()
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(LinearGradient(colors: [Color("PrimaryColorDark"),Color("PrimaryColor"),Color("PrimaryColorDark")], startPoint: .leading, endPoint: .trailing)))
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(Color.black)
                        .opacity(0.5)
                        .shadow(color: .black, radius: 6, x: 0, y: 4)
                        .blur(radius: 1, opaque: false))
                    .padding(.horizontal,25)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(Color.white)
                        .offset(y: -15)
                        .padding(.horizontal,50)
                        .opacity(0.5))
                    
                }
            }
        }
    }
}

#Preview {
    Next7DaysView(model: CityOverviewModel(lat: 49, long: 49), city: "BBSR")
}
