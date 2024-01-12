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
                .onAppear{
                    mainScreenViewModel.fetchWeather()
                }
        case .loading:
            ProgressView()
        case .loaded(let currentWeather):
            ScrollView {
                //TODO: MAPP IN VIEWMODEL
                CurrentWeatherView(
                    title: currentWeather.name,
                    currentTemp: String(currentWeather.temp.rounded()),
                    maxTemp: String(currentWeather.tempMax.rounded()),
                    minTemp: String(currentWeather.tempMin.rounded()),
                    description: currentWeather.weather.description,
                    image: ImageResource(name: currentWeather.weather.icon, bundle: .main),
                    date: DateFormatter().string(from: Date(timeIntervalSince1970: Double(currentWeather.timeStamp)))
                )
                Spacer(minLength: 10)
                Divider()
                HourlyForecastCarousel()
                Divider()
                DailyForecstList()
                Button ("SADASD"){
                    mainScreenViewModel.fetchWeather()
                }
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


private struct CurrentWeatherView: View {
    let title: String
    let currentTemp: String
    let maxTemp: String
    let minTemp: String
    let description: String
    let image: ImageResource
    let date: String
    
    var body: some View {
        VStack(alignment: .center) {
            Title(title: title)
            Image(image)
            CurrentTemp(temp: currentTemp)
            MaxAndMinTempView(max: maxTemp, min: minTemp)
            Description(description: description)
            Spacer(minLength: 20)
            LastUpdateTimeView(date: date)
        }
    }
}

private struct LastUpdateTimeView: View {
    let date: String
    
    var body: some View {
        HStack {
            OpenWeatherStamp()
            Spacer()
            DateView(date: date)
        }
        .padding([.trailing, .leading])
    }
}

private struct HourlyForecastCarousel: View {
    var body: some View {
        let itemWidth = UIScreen.main.bounds.width / 4
        let itemHeight = UIScreen.main.bounds.height / 4

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                //todo get hourlyForecastList and iterate
                ForEach([1,2,3,4,5,6,7,8,9], id: \.self) { _ in
                    HourlyWeatherItem(
                        time: "04:00 PM",
                        icon: ._02N,
                        description: "few clouds",
                        temperature: "47"
                    ).padding()
                        .frame(width: itemWidth, height: itemHeight)
                }
            }
        }
    }
}

private struct DailyForecstList: View {
    //todo get dailyForecastList and iterate
    var body: some View {
        ForEach([1,2,3,4,5,6,7],id: \.self) { _ in
            DailyForecastItem(
                date: "Tommorow Sun, Jan 7",
                description: "clear sky",
                icon: ._04N,
                temp: "47\u{00B0}/41\u{00B0}"
            )
            
            Divider()
        }
    }
}
