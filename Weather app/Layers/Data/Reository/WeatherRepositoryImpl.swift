//
//  WeatherRepositoryImpl.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import Resolver

class WeatherRepositoryImpl: WeatherRepository {
    init(apiService: WeatherApiService, locationService: LocationService) {
        self.apiService = apiService
        self.locationService = locationService // TODO: move to separate repo???
    }
    
    private let apiService: WeatherApiService
    private let locationService: LocationService
    
    func fetchCurrentWeatherInLocation() throws -> CurrentWeather {
        guard let latlong = locationService.getLatLong() else { throw CustomErrors.invalidLatLong }
        let data = try apiService.request(
            WeatherApiEndpoints.currentWeatherInLocation,
            parameters: [
                ApiParamsKeys.longitude: latlong.longitude,
                ApiParamsKeys.latitude: latlong.latitude,
                ApiParamsKeys.measurement: ApiParamsValues.measurementMetric, // TODO: getMetrics from locale
                ApiParamsKeys.language: "ru", // TODO language from locale
            ]
        )
        return try JSONDecoder().decode(CurrentWeather.self, from: data)
    }
    
    func fetchHourlyWeatherForecast() -> WeatherForecast {
        WeatherForecast(hourly: [], daily: [])  // TODO: replace
    }
}
