//
//  BaseUseCase.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation

protocol BaseUseCase {
    associatedtype In
    associatedtype Out
    
    func invoke(params: In) -> Out
}
