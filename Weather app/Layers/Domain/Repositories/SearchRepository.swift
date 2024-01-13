//
//  SearchRepository.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation
import RxSwift

protocol SearchCityRepository {
    func searchCityByName(name: String) throws -> Observable<Array<City>>
}
