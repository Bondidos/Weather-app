//
//  CityWetherMapper.swift
//  Weather app
//
//  Created by Vladimir on 14.01.24.
//

import Foundation

class CityWetherScreenViewMapper: MainScreenViewMapper {
    func toCityWeatherLoadedData(
        source: CurrentWeather
    ) -> CityWeatherLoadedData {
        CityWeatherLoadedData(
            title: source.name,
            currentTemp: formatTemp(source: source.temp),
            maxTemp: formatTemp(source: source.tempMax),
            minTemp: formatTemp(source: source.tempMin),
            description: source.weather.description,
            image: imageRecourseFromString(source: source.weather.icon),
            date: timeStampToFormattedString(timeStamp: source.timeStamp)
        )
    }
}
