//
//  UseCaseResult.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation
import RxSwift

enum InitMainScreenResult {
    case success(Observable<WeatherCurrentWithForecast>)
    case failed(String)
}
