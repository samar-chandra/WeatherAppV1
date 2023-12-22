//
//  FlippedHourlyBox.swift
//  WeatherApp
//
//  Created by Samar Chandra on 18/12/23.
//

import SwiftUI

struct FlippedHourlyBox: ViewModifier {
    var edgeColor: String
    var middleColor: String
    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerRadius: 40)
            .fill(LinearGradient(colors: [Color(edgeColor),Color(middleColor),Color(edgeColor)], startPoint: .leading, endPoint: .trailing)))
            .background(RoundedRectangle(cornerRadius: 40)
                                    .fill(Color.black)
                                    .opacity(0.5)
                                    .shadow(color: .black, radius: 6, x: 0, y: 4)
                                    .blur(radius: 1, opaque: false))
    }
}

