//
//  CurrentWeather.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation

struct CurrentWeather: Codable {
    let timeStamp: Int
    let name: String
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let weather: Weather
}
