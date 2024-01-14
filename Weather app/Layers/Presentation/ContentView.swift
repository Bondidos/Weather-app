//
//  ContentView.swift
//  Weather app
//
//  Created by Vladimir on 29.12.23.
//

import SwiftUI

enum ScreensStack: Hashable {
    case main
    case searchScreen
    case cityWeather(City)
}

struct ContentView: View {
    @State var navStack: [ScreensStack] = []
    
    var body: some View {
        NavigationStack (path: $navStack) {
            MainScreen(navStack: $navStack)
                .navigationDestination(for: ScreensStack.self) { screen in
                    switch screen {
                    case .main: MainScreen(navStack: $navStack)
                    case .cityWeather(let city): CityWeatherDetails(city: city)
                    case .searchScreen: SearchSheetScreen(navStack: $navStack)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

