//
//  MainScreenState.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation
import Resolver

enum MainPageStatus { case initial, loading, loaded, error }

struct MainScreenState {
    @Injected var repo: WeatherRepository
    
    func fetchWeather() {
        do {
            let result = try repo.fetchCurrentWeatherInLocation()
            print(result)

        } catch {
            print(error)
        }
    }
}
