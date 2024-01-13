//
//  SearchCityRepositoryImpl.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation
import RxAlamofire
import RxSwift

class SearchCityRepositoryImpl: SearchCityRepository {
    init(apiService: WeatherApiService, parcer: SearchCityRepositoryParcer) {
        self.apiService = apiService
        self.parcer = parcer
 }
    
    private let apiService: WeatherApiService
    private let parcer: SearchCityRepositoryParcer
    
    func searchCityByName(name: String) throws -> Observable<Array<City>> {
        apiService.request(
            WeatherApiEndpoints.searchCity,
            parameters: [
                ApiParamsKeys.cityName: name,
                ApiParamsKeys.limit: 10,
            ]
        ).map {self.parcer.toCityList(source: $0 as! Array<Any>)}
    }
}
