//
//  MainScreen.swift
//  Weather app
//
//  Created by Vladimir on 29.12.23.
//

import SwiftUI

struct MainScreen: View {
    
    @ObservedObject var mainScreenViewModel = MainScreenViewModel()
    
    var state: MainScreenState {
        mainScreenViewModel.state
    }
    
    var body: some View {
        
        switch state {
        case .initial:
            Text("Initializing")
                .onAppear { mainScreenViewModel.fetchWeather() }
        case .loading:
            ProgressView()
        case .loaded(let state):
            ScrollView {
                CurrentWeatherView(
                    title: state.title,
                    currentTemp: state.currentTemp,
                    maxTemp: state.maxTemp,
                    minTemp: state.minTemp,
                    description: state.description,
                    image: state.image,
                    date: state.date
                )
                Spacer(minLength: 10)
                Divider()
                HourlyForecastCarousel()
                Divider()
                DailyForecstList(dailyForecast: state.dailyForecast)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.mainBlue)
        case .error(let err):
            Text(err)
        }
    }
}

#Preview {
    MainScreen(
        mainScreenViewModel: MainScreenViewModel()
    )
}
