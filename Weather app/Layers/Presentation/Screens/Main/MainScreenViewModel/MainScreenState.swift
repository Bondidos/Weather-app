//
//  MainScreenState.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

enum MainScreenState { case initial, loading, loaded(MainScreenStateData), error(String) }

struct MainScreenStateData {
    let title: String
    let currentTemp: String
    let maxTemp: String
    let minTemp: String
    let description: String
    let image: ImageResource
    let date: String
    let dailyForecast: [DailyForecastStateData]
    let hourlyForecast: [HourlyForecastStateData]
    
    static func initState() -> MainScreenStateData {
        MainScreenStateData(title: "", currentTemp: "", maxTemp: "", minTemp: "", description: "", image: ._01D, date: "", dailyForecast: [], hourlyForecast: [])
    }
    
    func copyWith(
        title: String? = nil,
        currentTemp: String? = nil,
        maxTemp: String? = nil,
        minTemp: String? = nil,
        description: String? = nil,
        image: ImageResource? = nil,
        date: String? = nil,
        dailyForecast: [DailyForecastStateData]? = nil,
        hourlyForecast: [HourlyForecastStateData]? = nil
    ) -> MainScreenStateData {
        MainScreenStateData(
            title: title ?? self.title,
            currentTemp: currentTemp ?? self.currentTemp,
            maxTemp: maxTemp ?? self.maxTemp,
            minTemp: minTemp ?? self.minTemp,
            description: description ?? self.description,
            image: image ?? self.image,
            date: date ?? self.date,
            dailyForecast: dailyForecast ?? self.dailyForecast,
            hourlyForecast: hourlyForecast ?? self.hourlyForecast
        )
    }
}

struct DailyForecastStateData: Identifiable {
    let id: Int
    let date: String
    let description: String
    let icon: ImageResource
    let temp: String
}

struct HourlyForecastStateData: Identifiable {
    let id: Int
    let time: String
    let icon: ImageResource
    let description: String
    let temp: String
}
