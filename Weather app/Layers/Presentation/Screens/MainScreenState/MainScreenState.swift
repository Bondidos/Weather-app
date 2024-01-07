//
//  MainScreenState.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation

enum MainPageStatus { case initial, loading, loaded, error }

struct MainScreenState {
    init(_ weatherCurrentWithForecast: WeatherCurrentWithForecast?, _ status: MainPageStatus) {
        self.weatherCurrentWithForecast = weatherCurrentWithForecast
        self.status = status
    }
    let weatherCurrentWithForecast: WeatherCurrentWithForecast?
    let status: MainPageStatus
}
