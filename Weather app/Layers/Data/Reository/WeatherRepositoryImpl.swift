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
        let latlong = try getLocation()
        return apiService.request(
            WeatherApiEndpoints.currentWeatherInLocation,
            parameters: [
                ApiParamsKeys.longitude: latlong.longitude,
                ApiParamsKeys.latitude: latlong.latitude,
                ApiParamsKeys.measurement: mesurement,
                ApiParamsKeys.language: Locale.current.identifier,
            ]
        ).map { self.parcer.toCurrentWeather(json: $0 as! Dictionary<String, Any>) }
    }
    
    func fetchHourlyWeatherForecast() throws -> Observable<WeatherForecast> {
        let latlong = try getLocation()
        return apiService.request(
            WeatherApiEndpoints.weatherForecastInLocation,
            parameters: [
                ApiParamsKeys.longitude: latlong.longitude,
                ApiParamsKeys.latitude: latlong.latitude,
                ApiParamsKeys.measurement: mesurement,
                ApiParamsKeys.excludeFields: excludedFields
            ]
        ).map { self.parcer.toWeatherForecast(json: $0 as! Dictionary<String, Any>)}
    }
    
    private func getLocation() throws -> LatLng {
        guard let latlong = locationService.getLatLong() else { throw CustomErrors.invalidLatLong }
        return latlong
    }
    
    private var mesurement: String {
        Locale.current.identifier.contains("en")
        ? ApiParamsValues.measurementImperial
        : ApiParamsValues.measurementMetric
    }
    
    private var excludedFields: String {
        [ApiParamsValues.alertsMessages,ApiParamsValues.minutelyForecast,ApiParamsValues.currentlyForecast].joined(separator: ",")
    }
}
