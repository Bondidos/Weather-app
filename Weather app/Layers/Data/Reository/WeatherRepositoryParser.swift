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
            weather: toWeather(source: currentWeather)
        )
    }
    
    func toWeatherForecast(json: Dictionary<String, Any>) -> WeatherForecast {
        let hourly = json["hourly"] as! Array<Any>
        let daily = json["daily"] as! Array<Any>
        
        let hourlyForecast = hourly.map { item in
            let castedItem = item as! Dictionary<String, Any>
            let weatherlist = castedItem["weather"] as! Array<Any>
            return HourlyForecast(
                timeStamp: castedItem["dt"] as! Int,
                temp: castedItem["temp"] as! Double,
                weather: toWeather(source: weatherlist.first as! Dictionary<String, Any>)
            )
        }
        let dailyForecast = daily.map { item in
            let castedItem = item as! Dictionary<String, Any>
            let weatherlist = castedItem["weather"] as! Array<Any>
            let temp = castedItem["temp"] as! Dictionary<String, Any>
            return DailyForecast(
                timeStamp: castedItem["dt"] as! Int,
                minTemp: temp["min"] as! Double,
                maxTemp: temp["max"] as! Double,
                weather: toWeather(source: weatherlist.first as! Dictionary<String, Any>)
            )
        }
        return WeatherForecast(hourly: hourlyForecast, daily: dailyForecast)
    }
    
    private func toWeatherlist(weatherlist: Array<Any>) -> [Weather]{
        weatherlist.map { item in
            let castedItem = item as! Dictionary<String, Any>
            return toWeather(source: castedItem)
        }
    }
    
    private func toWeather(source: Dictionary<String, Any>) -> Weather {
        Weather(
            id: source["id"] as! Int,
            main: source["main"] as! String,
            description: source["description"] as! String,
            icon: source["icon"] as! String
        )
    }
}
