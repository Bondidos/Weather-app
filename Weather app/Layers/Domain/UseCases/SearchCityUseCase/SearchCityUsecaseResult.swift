//
//  SearchCityГыуСфыуКуыгде.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation
import RxSwift

enum SearchCityUsecaseResult {
    case success(Observable<Array<City>>), failure(String)
}
