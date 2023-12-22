//
//  URLType.swift
//  WeatherApp
//
//  Created by Samar Chandra on 18/12/23.
//

import Foundation
enum URLType{
    
    case name(String)
    
    case url(URL)

  var url: URL? {

    switch self {

      case .name(let name):

        return Bundle.main.url(forResource: name, withExtension: "GIF")

      case .url(let remoteURL):

        return remoteURL

    }

  }

}
