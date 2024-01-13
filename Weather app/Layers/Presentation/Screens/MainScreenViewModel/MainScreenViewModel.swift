//
//  MainScreenState.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation
import Resolver
import RxSwift


class MainScreenViewModel: ObservableObject {
    
    @Injected var repo: WeatherRepository
    @Injected var mapper: MainScreenViewMapper
    @Published var state: MainScreenState = .initial
    private var stateData: MainScreenStateData = MainScreenStateData.initState()
    
    private let disposeBag = DisposeBag()
    
    func fetchWeather() {
        do {
            state = .loading
            try repo.fetchCurrentWeatherInLocation()
                .subscribe { currentweather in
                    self.stateData = self.mapper.setCurrentWetherToState(currentWeather: currentweather, mainScreenStateData: self.stateData)
                    
                    self.state = .loaded(self.stateData)
                } onError: { err in
                    self.state = .error("SomeNetworkError")
                }.disposed(by: disposeBag)
            
        } catch {
            // location error
            print(error)
        }
    }
}
