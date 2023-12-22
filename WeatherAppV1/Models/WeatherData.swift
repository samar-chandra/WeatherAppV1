/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct WeatherData : Codable {
	let lat : Int?
	let lon : Int?
	let timezone : String?
	let timezone_offset : Int?
	let current : Current?
	let hourly : [Hourly]?
	let daily : [Daily]?

	enum CodingKeys: String, CodingKey {

		case lat = "lat"
		case lon = "lon"
		case timezone = "timezone"
		case timezone_offset = "timezone_offset"
		case current = "current"
		case hourly = "hourly"
		case daily = "daily"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lat = try? values.decodeIfPresent(Int.self, forKey: .lat)
		lon = try? values.decodeIfPresent(Int.self, forKey: .lon)
		timezone = try? values.decodeIfPresent(String.self, forKey: .timezone)
		timezone_offset = try? values.decodeIfPresent(Int.self, forKey: .timezone_offset)
		current = try? values.decodeIfPresent(Current.self, forKey: .current)
		hourly = try? values.decodeIfPresent([Hourly].self, forKey: .hourly)
		daily = try? values.decodeIfPresent([Daily].self, forKey: .daily)
	}

}
