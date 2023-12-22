//
//  DailyForecaseView.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DailyForecastView: View {
    @State var date: String
    @State var iconString: String
    @State var highTemp: Double
    @State var lowTemp: Double
    var body: some View {
        VStack{
            HStack(spacing: 32){
                Image(iconString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("\(highTemp, specifier: "%.1f")°")
                    .font(.title)
                    .fontWeight(.semibold)
                Text(date)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    DailyForecastView(date: "14th Dec", iconString: "cloud", highTemp: 0.0, lowTemp: 0.0)
}
