//
//  SearchCityUseCase.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation
import RxSwift

class SearchCityUseCase {
    init(repo: SearchCityRepository) {
        self.repo = repo
    }
    
    private let repo: SearchCityRepository
    
    func invoke(name: String) -> SearchCityUsecaseResult {
        do {
            return try .success(repo.searchCityByName(name: name))
        } catch {
            return .failure(error.localizedDescription)
        }
    }
}
