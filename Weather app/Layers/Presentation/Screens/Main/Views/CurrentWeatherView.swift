//
//  CurrentWeather.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct CurrentWeatherView: View {
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

struct LastUpdateTimeView: View {
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
