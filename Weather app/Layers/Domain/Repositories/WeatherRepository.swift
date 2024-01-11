//
//  WeatherRepository.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation

protocol WeatherRepository {
    func fetchWeatherFromApi() -> WeatherCurrentWithForecast
    func fetchCurrentWeatherForCity() -> CurrentWeather
}
