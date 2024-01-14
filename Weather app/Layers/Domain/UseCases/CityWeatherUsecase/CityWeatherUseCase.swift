//
//  CityWeatherUseCase.swift
//  Weather app
//
//  Created by Vladimir on 14.01.24.
//

import Foundation
import RxSwift

class CityWeatherUseCase {
    init(repo: WeatherRepository) {
        self.repo = repo
    }
    
    private let repo: WeatherRepository
    
    func invoke(latLong: LatLng) -> CityWeatherUseCaseResult {
        return .success( repo.fetchCurrentWeatherByLatLng(latLng: latLong ))
    }
}
