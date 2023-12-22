//
//  DateDescriptionStack.swift
//  WeatherApp
//
//  Created by Samar Chandra on 18/12/23.
//

import SwiftUI

struct DateDescriptionStack: View {
    @State var iconName: String
    @State var value: String
    @State var label: String
    var body: some View {
        VStack {
            Image(systemName: iconName)
            Text("\(value)")
                .fontWeight(.bold)
            Text(label)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

