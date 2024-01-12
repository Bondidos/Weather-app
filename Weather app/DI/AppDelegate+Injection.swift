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
    }
}

extension Resolver {
    public static func registerServices() {
        register { CLLocationManager()}
        register { LocationService(locationManager: resolve()) }
        register{ WeatherApiService()}
    }
    
    public static func registerRepository() {
        register{WeatherRepositoryImpl(apiService: resolve(), locationService: resolve())}
            .implements(WeatherRepository.self)
    }
    
    public static func registerUseCases() {
        
    }
}
