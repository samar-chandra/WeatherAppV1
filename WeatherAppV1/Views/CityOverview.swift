//
//  CityOverview.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import SwiftUI
import SDWebImageSwiftUI
import FLAnimatedImage



struct CityOverview: View {
    @State var city: String
    @State var time: String
    @State var lat: Double
    @State var long: Double
    @State var flipped = true
    @State var flipped2 = true
    
    @ObservedObject private var model: CityOverviewModel
    init(city: String, time: String, lat: Double, long: Double) {
        self.city = city
        self.time = time
        self.lat = lat
        self.long = long
        self.model = CityOverviewModel(lat: lat, long: long)
        
    }
    var body: some View {
        ZStack {
            MovingGradient()
                .ignoresSafeArea()
            VStack(spacing: 32){
                header
                currentWeather
                informationBox
                hourlyForecast
                Spacer()
            }
            .offset(y:50)
        }
        .ignoresSafeArea()
    }
    private var header: some View {
        VStack {
            Text(city)
                .font(.title)
                .fontWeight(.semibold)
            Text(model.timeFormatter.string(from: model.weatherData?.current?.dt ?? Date()))
                .font(.title3)
        }
    }
    
    private var currentWeather: some View {
        VStack{
            Image(model.getIconString(iconStr: model.weatherData?.current?.weather?.first?.icon ?? "01d"))
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Text(String(format: "%.2f", model.temp - 273.0)+"°")
                .font(.system(size: 64))
            Text("\(model.description)".capitalized)
        }
        .foregroundColor(.white)
        .padding()
        .modifier(CustomCardView())
        .overlay(
            Text(model.dateFormatter.string(from: model.weatherData?.current?.dt ?? Date()))
                .font(.footnote)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white))
                .offset(y: -10)
            , alignment: .top
        )
        .padding(.horizontal, 25)
    }
    
    private var informationBox: some View {
        HStack(spacing: 16) {
            if flipped{
                ValueDescriptionStack(iconName: "humidity.fill",value: $model.humidity,label: "Humidity")
                    
                ValueDescriptionStack(iconName: "wind",value: $model.windSpeed,label: "Wind Speed")
                ValueDescriptionStack(iconName: "aqi.medium",value: $model.pressure,label: "Pressure")
                ValueDescriptionStack(iconName: "thermometer.low",value: $model.feelsLike,label: "Feels Like")
            }else{
                DateDescriptionStack(iconName: "sunrise.fill",value: model.timeFormatter.string(from: model.sunrise), label: "Sunrise")
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                GIFView(type: .url(URL(string: "https://i.ibb.co/KzXQT4n/A-Christmas-GIF.gif")!))
                    .clipShape(Capsule())
                
                
                DateDescriptionStack(iconName: "sunset.fill",value: model.timeFormatter.string(from: model.sunset),label: "Sunset")
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(RoundedRectangle(cornerRadius: 40)
            .fill(RadialGradient(colors: [.clear, Color.white],
                                   center: .center,
                                   startRadius: 1,
                                   endRadius: 100)
                                    .opacity(0.6))
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.white, lineWidth: 5)))
        .padding(.horizontal,10)
        .rotation3DEffect(
            flipped ? Angle(degrees: 180) : .zero,
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(.default, value: flipped)
        .onTapGesture {
            flipped.toggle()
        }
    }
    
    private var hourlyForecast: some View {
        VStack(spacing: 16){
            HStack{
                Text("Today")
                Spacer()
                NavigationLink(destination: Next7DaysView(model: self.model, city:self.city)){
                    Text("Next 7 Days")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.primary)
            }
            .font((Font.body.bold()))
            .padding(.horizontal, 25)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(model.hourlyData, id: \.dt) {
                        forecast in                       /*WeatherAppMainViewFramework.MainTextField(icon: model.getIconString(iconStr: forecast.weather?.first?.icon ?? "10d"), temp: String(format: "%.1f", (forecast.temp ?? 0.0) - 273.0), time: model.timeFormatter.string(from: forecast.dt ?? Date()))*/
                        HourlyBox(time: model.timeFormatter.string(from: forecast.dt ?? Date()), icon: model.getIconString(iconStr: forecast.weather?.first?.icon ?? "10d"), temp: String(format: "%.1f", (forecast.temp ?? 0.0) - 273.0))
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CityOverview(city:"Bhubaneshwar", time: "10.40 AM", lat: 85, long: 85)
}


