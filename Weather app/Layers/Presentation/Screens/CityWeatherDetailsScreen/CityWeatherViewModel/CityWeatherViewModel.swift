//
//  CityWeatherViewModel.swift
//  Weather app
//
//  Created by Vladimir on 14.01.24.
//

import Foundation
import RxSwift
import Resolver

class CityWeatherViewModel: ObservableObject {
    
    @Injected private var cityWeatherUseCase: CityWeatherUseCase
    @Injected private var cityWeatherViewMapper: CityWetherScreenViewMapper
    
    private let disposeBag = DisposeBag()
    @Published var state: CityWeatherState = .initial
    
    func fetchWeather(latLng: LatLng) {
        state = .loading
        switch cityWeatherUseCase.invoke(latLong: latLng) {
        case .success(let observable):
            observable.subscribe {
                self.state = .loaded(self.cityWeatherViewMapper.toCityWeatherLoadedData(source: $0)
                )
            }
        onError: {print($0)}
                .disposed(by: disposeBag)
        case .error(let err): print(err)
        }
    }
}
