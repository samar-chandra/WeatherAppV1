/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Current : Codable {
	let dt : Date?
	let sunrise : Date?
	let sunset : Date?
	let temp : Double?
	let feels_like : Double?
	let pressure : Int?
	let humidity : Int?
	let dew_point : Double?
	let uvi : Double?
	let clouds : Int?
	let visibility : Int?
	let wind_speed : Double?
	let wind_deg : Int?
	let weather : [Weather]?

	enum CodingKeys: String, CodingKey {

		case dt = "dt"
		case sunrise = "sunrise"
		case sunset = "sunset"
		case temp = "temp"
		case feels_like = "feels_like"
		case pressure = "pressure"
		case humidity = "humidity"
		case dew_point = "dew_point"
		case uvi = "uvi"
		case clouds = "clouds"
		case visibility = "visibility"
		case wind_speed = "wind_speed"
		case wind_deg = "wind_deg"
		case weather = "weather"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dt = try? values.decodeIfPresent(Date.self, forKey: .dt)
		sunrise = try? values.decodeIfPresent(Date.self, forKey: .sunrise)
		sunset = try? values.decodeIfPresent(Date.self, forKey: .sunset)
		temp = try? values.decodeIfPresent(Double.self, forKey: .temp)
		feels_like = try? values.decodeIfPresent(Double.self, forKey: .feels_like)
		pressure = try? values.decodeIfPresent(Int.self, forKey: .pressure)
		humidity = try? values.decodeIfPresent(Int.self, forKey: .humidity)
		dew_point = try? values.decodeIfPresent(Double.self, forKey: .dew_point)
		uvi = try? values.decodeIfPresent(Double.self, forKey: .uvi)
		clouds = try? values.decodeIfPresent(Int.self, forKey: .clouds)
		visibility = try? values.decodeIfPresent(Int.self, forKey: .visibility)
		wind_speed = try? values.decodeIfPresent(Double.self, forKey: .wind_speed)
		wind_deg = try? values.decodeIfPresent(Int.self, forKey: .wind_deg)
		weather = try? values.decodeIfPresent([Weather].self, forKey: .weather)
	}

}
