//
//  DiContainer.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import Resolver
import CoreLocation

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerServices()
        registerRepository()
        registerUseCases()
        registerUiMapper()
    }
}

extension Resolver {
    public static func registerServices() {
        register { LocationService() }
        register{ WeatherApiService()}
    }
    
    public static func registerRepository() {
        register { WeatherRepositoryParcer() }
        register { SearchCityRepositoryParcer() }
        register {WeatherRepositoryImpl(apiService: resolve(), locationService: resolve(), parcer: resolve())}
            .implements(WeatherRepository.self)
        register{SearchCityRepositoryImpl(apiService: resolve(), parcer: resolve())}
            .implements(SearchCityRepository.self)
    }
    
    public static func registerUseCases() {
        register {InitMainScreenUseCase(repo: resolve())}
        register {SearchCityUseCase(repo: resolve())}
        register {CityWeatherUseCase(repo: resolve())}
    }
    
    public static func registerUiMapper() {
        register {
            MainScreenViewMapper()
        }
        register {CityWetherScreenViewMapper()}
    }
}
