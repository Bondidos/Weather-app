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
            let observable = try repo.fetchCurrentWeatherInLocation()
            return InitMainScreenResult.success(observable)
        } catch {
            return InitMainScreenResult.failed(error.localizedDescription)
        }
    }
}
