//
//  MainScreenState.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

enum MainScreenState { case initial, loading, loaded(MainScreenStateData), error(String) }

struct MainScreenStateData {
    let title: String
    let currentTemp: String
    let maxTemp: String
    let minTemp: String
    let description: String
    let image: ImageResource
    let date: String
    
    static func initState() -> MainScreenStateData {
        MainScreenStateData(title: "", currentTemp: "", maxTemp: "", minTemp: "", description: "", image: ._01D, date: "")
    }
    
    func copyWith(
        title: String? = nil,
        currentTemp: String? = nil,
        maxTemp: String? = nil,
        minTemp: String? = nil,
        description: String? = nil,
        image: ImageResource? = nil,
        date: String? = nil
    ) -> MainScreenStateData {
        MainScreenStateData(
            title: title ?? self.title,
            currentTemp: currentTemp ?? self.currentTemp,
            maxTemp: maxTemp ?? self.maxTemp,
            minTemp: minTemp ?? self.minTemp,
            description: description ?? self.description,
            image: image ?? self.image,
            date: date ?? self.date
        )
    }
}
