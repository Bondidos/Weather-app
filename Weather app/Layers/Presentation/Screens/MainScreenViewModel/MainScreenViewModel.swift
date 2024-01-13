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
    
    @Published var state: MainScreenState = .initial
    @Injected private var mapper: MainScreenViewMapper
    @Injected private var initMainScreen: InitMainScreenUseCase
    private var stateData: MainScreenStateData = MainScreenStateData.initState()
    
    private let disposeBag = DisposeBag()
    
    func fetchWeather() {
        state = .loading
        
        switch initMainScreen.invoke() {
        case .success(let observable):
            observable.subscribe { weatherWithForecast in
                self.stateData = self.mapper
                    .toScreenState(
                        mainScreenStateData: self.stateData,
                        weatherWithForecast: weatherWithForecast
                    )
                
                self.state = .loaded(self.stateData)
            } onError: { err in
                self.state = .error("SomeNetworkError")
            }
            .disposed(by: disposeBag)
        case .failed(let error): print(error)// TODO: Show SnackBar (LocationError)
        }
    }
}
