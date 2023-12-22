//
//  HourlyChartView.swift
//  WeatherApp
//
//  Created by Samar Chandra on 15/12/23.
//

import SwiftUI
import Charts

struct HourlyChartView: View {
    @ObservedObject var model: CityOverviewModel
    var body: some View {
        Chart {
            ForEach(model.dailyData, id: \.dt) {
                forecast in
                LineMark(x: .value("Date", model.smallerDateFormatter.string(from: forecast.dt ?? Date())),
                        y: .value("Temperature", (forecast.temp?.day ?? 0.0) - 273))
                .foregroundStyle(Color("PrimaryColor"))
                .symbol(by: .value("Temprature", model.smallerDateFormatter.string(from: forecast.dt ?? Date())))
                .interpolationMethod(.catmullRom)
                .symbolSize(30)
            }
        }
        .chartYScale(domain: [27, 29])
        .aspectRatio(1, contentMode: .fit)
        .padding()
        
    }
}

#Preview {
    HourlyChartView(model: CityOverviewModel(lat: 0.0, long: 0.0))
}
