//
//  WeatherService.swift
//  UdemyWeatherAPI (iOS)
//
//  Created by 박승훈 on 2021/08/13.
//

import Foundation

class WeatherService {

    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {

        guard let url = URL(string:
            "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6c6c43c5bcf8f4f7472425141e246f1c&units=imperial") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let weatherResponse = try?
            JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
