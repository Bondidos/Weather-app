//
//  MainScreen.swift
//  Weather app
//
//  Created by Vladimir on 29.12.23.
//

import SwiftUI

struct MainScreen: View {
    
    @State var mainScreenState: MainScreenState
    
    var body: some View {
        
        ScrollView {
            //todo fill stack from mainScreenState
            CurrentWeatherView(
                title: "Mountain View",
                currentTemp: "47",
                maxTemp: "53",
                minTemp: "41",
                description: "clear sky",
                image: ._02D,
                date: "Sat, Jan 6"
            )
            Spacer(minLength: 10)
            Divider()
            HourlyForecastCarousel()
            Divider()
            DailyForecstList()
            Button ("SADASD"){
                mainScreenState.fetchWeather()
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.mainBlue)
    }
}

#Preview {
    MainScreen(
        mainScreenState: MainScreenState()
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
