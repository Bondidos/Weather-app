//
//  MainScreenViewMapper.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct MainScreenViewMapper {
    func setCurrentWetherToState(
        currentWeather: CurrentWeather,
        mainScreenStateData: MainScreenStateData
    ) -> MainScreenStateData {
        mainScreenStateData.copyWith(
            title: currentWeather.name,
            currentTemp: String(format: "%.0f", currentWeather.temp),
            maxTemp: String(format: "%.0f", currentWeather.tempMax),
            minTemp: String(format: "%.0f", currentWeather.tempMin),
            description: currentWeather.weather.description,
            image: ImageResource(name: currentWeather.weather.icon, bundle: .main),
            date: timeStampToFormattedString(timeStamp: currentWeather.timeStamp)
        )
    }
    
    private func timeStampToFormattedString(timeStamp: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
}
