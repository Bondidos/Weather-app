//
//  DiContainer.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerMyNetworkServices()
        registerUseCases()
    }
}

extension Resolver {
    public static func registerMyNetworkServices() {
        register{ WeatherApiServiceImpl()}
            .implements(WeatherApiService.self)
        
        register{WeatherRepositoryImpl(apiService: resolve())}
            .implements(WeatherRepository.self)
    }
}

extension Resolver {
    public static func registerUseCases() {
        
    }
}
