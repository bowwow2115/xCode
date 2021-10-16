//
//  Weather.swift
//  UdemyWeatherAPI (iOS)
//
//  Created by 박승훈 on 2021/08/13.
//

import Foundation

struct WeatherResponse: Decodable { //json outer key값
    let main: Weather
}

struct Weather: Decodable{
    var temp: Double?
    var humidity: Double?
}
