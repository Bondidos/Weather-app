//
//  InitmainScreenUseCase.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation
import RxSwift

final class InitMainScreenUseCase {
    init(repo: WeatherRepository) {
        self.repo = repo
    }
    
    private let repo: WeatherRepository
    
    func invoke() -> InitMainScreenResult {
        do {
            let currentWeather = try repo.fetchCurrentWeatherInLocation()
            let weatherForecast = try repo.fetchHourlyWeatherForecast()
            let result = Observable
                .zip(currentWeather, weatherForecast)
                .map { (current, foreast) in
                WeatherCurrentWithForecast(
                    currentWeather: current,
                    dailyForecast: foreast.daily,
                    hourlyForecast: foreast.hourly
                )
            }
            return InitMainScreenResult.success(result)
        } catch {
            return InitMainScreenResult.failed(error.localizedDescription)
        }
    }
}
