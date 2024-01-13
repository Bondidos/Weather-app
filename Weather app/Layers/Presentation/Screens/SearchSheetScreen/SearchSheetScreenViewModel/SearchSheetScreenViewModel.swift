//
//  SearchScreenViewModel.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation
import RxSwift
import Resolver

class SearchSheetScreenViewModel: ObservableObject {
    
    init() {
        searchSubject
            .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe { event in
                switch self.searchCity.invoke(name: event) {
                case .success(let observer):
                    observer.subscribe { cities in
                        self.cities = cities
                    } onError: { error in
                        print(error)
                    }.disposed(by: self.disposeBag)
                case .failure(let failure):
                    print(failure)
                }
            }.disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
    let searchSubject = PublishSubject<String>()
    @Injected var searchCity: SearchCityUseCase
    @Published var cities = [City]()
    
    func handleInput(text: String) {
        searchSubject.onNext(text)
    }
    func onTap(city: City) {
        print(city)
    }
    
}
