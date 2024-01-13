//
//  WeatherRepositoryParser.swift
//  Weather app
//
//  Created by Vladimir on 12.01.24.
//

import Foundation


class WeatherRepositoryParcer {
    func toCurrentWeather(json: Dictionary<String, Any>) -> CurrentWeather {
        let main = json["main"] as! Dictionary<String, Any>
        let weather = json["weather"] as! Array<Any>
        let currentWeather = weather.first as! Dictionary<String, Any>
        return CurrentWeather(
            timeStamp: json["dt"] as! Int,
            name: json["name"] as! String,
            temp: main["temp"] as! Double,
            feelsLike: main["feels_like"] as! Double,
            tempMin: main["temp_min"] as! Double,
            tempMax: main["temp_max"] as! Double,
            weather: Weather(
                id: currentWeather["id"] as! Int,
                main: currentWeather["main"] as! String,
                description: currentWeather["description"] as! String,
                icon: currentWeather["icon"] as! String
            )
        )
    }
}
