//
//  WeatherCurrentWithForecast.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation

struct WeatherCurrentWithForecast{
    let currentWeather: CurrentWeather
    let dailyForecast: [DailyForecast]
    let hourlyForecast: [HourlyForecast]
}
