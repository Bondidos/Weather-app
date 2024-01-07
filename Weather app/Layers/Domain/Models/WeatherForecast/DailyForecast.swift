//
//  DailyForecast.swift
//  Weather app
//
//  Created by Vladimir on 29.12.23.
//

import Foundation

struct DailyForecast {
    let timeStamp: Int
    let  minTemp: Double
    let maxTemp: Double
    let weather: Weather
    
    init(timeStamp: Int,
         minTemp: Double,
         maxTemp: Double,
         weather: Weather
    ) {
        self.timeStamp = timeStamp
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.weather = weather
    }
}
