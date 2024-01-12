//
//  WeatherRepositoryImpl.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import Resolver
import RxSwift

class WeatherRepositoryImpl: WeatherRepository {
    init(apiService: WeatherApiService, locationService: LocationService, parcer: WeatherRepositoryParcer) {
        self.apiService = apiService
        self.locationService = locationService
        self.parcer = parcer
    }
    
    private let apiService: WeatherApiService
    private let locationService: LocationService
    private let parcer: WeatherRepositoryParcer
    
    func fetchCurrentWeatherInLocation() throws -> Observable<CurrentWeather> {
        guard let latlong = locationService.getLatLong() else { throw CustomErrors.invalidLatLong }
        return apiService.request(
            WeatherApiEndpoints.currentWeatherInLocation,
            parameters: [
                ApiParamsKeys.longitude: latlong.longitude,
                ApiParamsKeys.latitude: latlong.latitude,
                ApiParamsKeys.measurement: ApiParamsValues.measurementMetric, // TODO: getMetrics from locale
                ApiParamsKeys.language: "ru", // TODO language from locale
            ]
        ).map { self.parcer.toCurrentWeather(json: $0) }
    }
    
    func fetchHourlyWeatherForecast() throws -> Observable<WeatherForecast> {
        throw CustomErrors.fetchDataRemouteError
    }
}
