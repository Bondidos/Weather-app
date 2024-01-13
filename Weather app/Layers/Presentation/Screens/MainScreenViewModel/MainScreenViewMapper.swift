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
            currentTemp: String(format: "%.0f", currentWeather.temp) + addTempSymbol(),
            maxTemp: String(format: "%.0f", currentWeather.tempMax) + addTempSymbol(),
            minTemp: String(format: "%.0f", currentWeather.tempMin) + addTempSymbol(),
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
    
    private func addTempSymbol() -> String {
        return Locale.current.identifier.contains("en")
        ? "\u{00B0}F"
        : "\u{00B0}C"
    }
}
