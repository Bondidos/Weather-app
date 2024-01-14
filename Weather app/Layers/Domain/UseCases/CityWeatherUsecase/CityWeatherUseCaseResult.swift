//
//  CityWeatherUseCaseResult.swift
//  Weather app
//
//  Created by Vladimir on 14.01.24.
//

import Foundation
import RxSwift

enum CityWeatherUseCaseResult {
    case success(Observable<CurrentWeather>), error(String)
}
