//
//  ApiConstants.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation

struct ApiParamsKeys {
    static let longitude = "lon"
    static let latitude = "lat"
    static let language = "lang"
    static let measurement = "units"
    static let excludeFields = "exclude"
    static let cityName = "q"
}

struct ApiParamsValues {
    static let measurementImperial = "imperial"
    static let measurementMetric = "metric"
    static let minutelyForecast = "minutely"
    static let alertsMessages = "alerts"
    static let currentlyForecast = "current"
    static let dailyForecast = "daily";
}

struct WeatherApiEndpoints {
    static let currentWeatherInLocation = "/data/2.5/weather"
    static let weatherForecastInLocation = "/data/2.5/onecall"
}
