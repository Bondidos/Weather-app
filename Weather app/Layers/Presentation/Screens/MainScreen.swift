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
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.mainBlue)
    }
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
            HStack {
                OpenWeatherStamp()
                Spacer()
                DateView(date: date)
            }
            .padding([.trailing, .leading])
        }
    }
}

#Preview {
    MainScreen(
        mainScreenState: MainScreenState(nil, .error)
    )
}
