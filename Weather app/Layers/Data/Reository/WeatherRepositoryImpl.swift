//
//  WeatherRepositoryImpl.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import Resolver

class WeatherRepositoryImpl: WeatherRepository {
    init(apiService: WeatherApiService) {
        self.apiService = apiService
    }
    
    @Injected private var apiService: WeatherApiService
    
    func fetchWeatherFromApi() -> WeatherCurrentWithForecast {
        apiService.request(<#T##convertible: URLRequestConvertible##URLRequestConvertible#>)
    }
    
    func fetchCurrentWeatherForCity() -> CurrentWeather {
        <#code#>
    }
    
    
}
