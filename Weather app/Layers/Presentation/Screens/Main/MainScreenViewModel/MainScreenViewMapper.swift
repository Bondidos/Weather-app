//
//  MainScreenViewMapper.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct MainScreenViewMapper {
    
    func toScreenState(
        mainScreenStateData: MainScreenStateData,
        weatherWithForecast: WeatherCurrentWithForecast
    ) -> MainScreenStateData {
        var state = setCurrentWetherToState(currentWeather: weatherWithForecast.currentWeather, mainScreenStateData: mainScreenStateData)
        state = setDailyForecast(mainScreenStateData: state, dailyForecastList: weatherWithForecast.dailyForecast)
        state = setHourlyForecast(hourlyForecast: weatherWithForecast.hourlyForecast, mainScreenStateData: state)
        return state
    }
    
    private func setHourlyForecast(
        hourlyForecast: Array<HourlyForecast>,
        mainScreenStateData: MainScreenStateData
    ) -> MainScreenStateData {
        var forecast = hourlyForecast.enumerated().map { (index, item) in
            HourlyForecastStateData(
                id: index,
                time: timeStampToFormattedTimeString(timeStamp: item.timeStamp),
                icon: imageRecourseFromString(source: item.weather.icon),
                description: item.weather.description,
                temp: formatTemp(source: item.temp)
            )
        }
        forecast.removeFirst()
        return mainScreenStateData.copyWith(hourlyForecast: Array(forecast.prefix(24)))
    }
    
    private func setCurrentWetherToState(
        currentWeather: CurrentWeather,
        mainScreenStateData: MainScreenStateData
    ) -> MainScreenStateData {
        mainScreenStateData.copyWith(
            title: currentWeather.name,
            currentTemp: formatTemp(source: currentWeather.temp),
            maxTemp: formatTemp(source: currentWeather.tempMax),
            minTemp: formatTemp(source: currentWeather.tempMin),
            description: currentWeather.weather.description,
            image: imageRecourseFromString(source: currentWeather.weather.icon),
            date: timeStampToFormattedString(timeStamp: currentWeather.timeStamp)
        )
    }
    
    private func setDailyForecast(
        mainScreenStateData: MainScreenStateData,
        dailyForecastList: Array<DailyForecast>
    ) -> MainScreenStateData {
        var forecast = dailyForecastList.enumerated().map { (index, item) in
            DailyForecastStateData(
                id: index,
                date: timeStampToFormattedString(timeStamp: item.timeStamp),
                description: item.weather.description,
                icon: imageRecourseFromString(source: item.weather.icon),
                temp: formatTemp(source: item.maxTemp) + "/" + formatTemp(source: item.minTemp)
            )
        }
        forecast.removeFirst()
        return mainScreenStateData.copyWith(dailyForecast: forecast)
    }
    
    private func imageRecourseFromString(source: String) -> ImageResource {
        ImageResource(name: source, bundle: .main)
    }
    
    private func timeStampToFormattedString(timeStamp: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
    
    private func timeStampToFormattedTimeString(timeStamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(Double(timeStamp)))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
    
    private func formatTemp(source: Double) -> String {
        String(format: "%.0f", source) + addTempSymbol()
    }
    
    private func addTempSymbol() -> String {
        return Locale.current.identifier.contains("en")
        ? "\u{00B0}F"
        : "\u{00B0}C"
    }
}
