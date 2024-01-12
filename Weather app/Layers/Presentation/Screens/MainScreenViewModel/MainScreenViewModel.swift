//
//  MainScreenState.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation
import Resolver
import RxSwift

enum MainScreenState { case initial, loading, loaded(CurrentWeather), error(String) }

class MainScreenViewModel: ObservableObject {
    
    @Injected var repo: WeatherRepository
    @Published var state: MainScreenState = .initial
    
    private let disposeBag = DisposeBag()
    
    func fetchWeather() {
        do {
            state = .loading
            try repo.fetchCurrentWeatherInLocation()
                .subscribe { currentweather in
                    self.state = .loaded(currentweather)
                } onError: { err in
                    self.state = .error("SomeNetworkError")
                }.disposed(by: disposeBag)
            
        } catch {
            // location error
            print(error)
        }
    }
}
