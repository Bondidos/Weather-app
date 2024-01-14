//
//  CityWeatherState.swift
//  Weather app
//
//  Created by Vladimir on 14.01.24.
//

import Foundation
import SwiftUI

enum CityWeatherState {
    case initial, loading, loaded(CityWeatherLoadedData), error(String)
}

class CityWeatherLoadedData {
    init(title: String, currentTemp: String, maxTemp: String, minTemp: String, description: String, image: ImageResource, date: String) {
        self.title = title
        self.currentTemp = currentTemp
        self.maxTemp = maxTemp
        self.minTemp = minTemp
        self.description = description
        self.image = image
        self.date = date
    }
    
    let title: String
    let currentTemp: String
    let maxTemp: String
    let minTemp: String
    let description: String
    let image: ImageResource
    let date: String
}
