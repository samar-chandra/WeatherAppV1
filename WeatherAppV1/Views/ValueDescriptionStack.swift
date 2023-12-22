//
//  ValueDescriptionStack.swift
//  WeatherApp
//
//  Created by Samar Chandra on 13/12/23.
//

import SwiftUI

struct ValueDescriptionStack: View {
    @State var iconName: String
    @Binding var value: Int
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
