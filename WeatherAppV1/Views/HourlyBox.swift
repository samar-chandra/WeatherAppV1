//
//  HourlyBox.swift
//  WeatherApp
//
//  Created by Samar Chandra on 14/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HourlyBox: View {
    @State var time: String
    @State var icon: String
    @State var temp: String
    var body: some View {
        VStack{
            Text("\(time)")
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(temp + "°")
                .font(.title2)
                .fontWeight(.bold)
        }
        .foregroundColor(.white)
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 40)
            .fill(LinearGradient(colors: [Color("PrimaryColorDark"),Color("PrimaryColor"),Color("PrimaryColorDark")], startPoint: .leading, endPoint: .trailing)))
        .background(RoundedRectangle(cornerRadius: 40)
                                .fill(Color.black)
                                .opacity(0.5)
                                .shadow(color: .black, radius: 6, x: 0, y: 4)
                                .blur(radius: 1, opaque: false))
        
    }
}



