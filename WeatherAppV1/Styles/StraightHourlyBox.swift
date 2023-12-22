//
//  StraightHourlyBox.swift
//  WeatherApp
//
//  Created by Samar Chandra on 18/12/23.
//

import SwiftUI

struct StraightHourlyBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerRadius: 40)
            .fill(LinearGradient(colors: [Color("PrimaryColorDark"),Color("PrimaryColor"),Color("PrimaryColorDark")], startPoint: .leading, endPoint: .trailing)))
            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(Color.black)
                                .opacity(0.5)
                                .shadow(color: .black, radius: 6, x: 0, y: 4)
                                .blur(radius: 1, opaque: false))
    }
}
