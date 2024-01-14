//
//  CityWeatherDetails.swift
//  Weather app
//
//  Created by Vladimir on 14.01.24.
//

import SwiftUI

struct CityWeatherDetails: View {
    let city: City
    @ObservedObject var viewModel: CityWeatherViewModel = CityWeatherViewModel()
    var state: CityWeatherState {
        viewModel.state
    }
    
    var body: some View {
        ZStack {
            
            switch state {
            case .initial:
                Text("Initializing")
                    .onAppear {
                        viewModel.fetchWeather(latLng: city.latlong)
                    }
            case .loading:
                ProgressView()
            case .loaded(let cityWeatherLoadedData):
                CurrentCityWeather(
                    title: cityWeatherLoadedData.title,
                    currentTemp: cityWeatherLoadedData.currentTemp,
                    maxTemp: cityWeatherLoadedData.maxTemp,
                    minTemp: cityWeatherLoadedData.minTemp,
                    description: cityWeatherLoadedData.description,
                    image: cityWeatherLoadedData.image,
                    date: cityWeatherLoadedData.date
                )
            case .error(let string):
                Text(string)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainBlue)
    }
}

private struct CurrentCityWeather: View {
    let title: String
    let currentTemp: String
    let maxTemp: String
    let minTemp: String
    let description: String
    let image: ImageResource
    let date: String
    
    var body: some View {
        ScrollView {
            Title(title: title)
                .padding(.bottom)
            CurrentTemp(temp: currentTemp)
            Image(image)
            MaxAndMinTempView(max: maxTemp, min: minTemp)
                .padding(.bottom)
            Description(description: description)
                .padding(.bottom)
            LastUpdateTimeView(date: date)
        }
    }
}

#Preview {
    CityWeatherDetails(city: City(id: 1, name: "Muhosransk", country: "Uncharted", latlong: LatLng(latitude: 0, longitude: 0)))
}
