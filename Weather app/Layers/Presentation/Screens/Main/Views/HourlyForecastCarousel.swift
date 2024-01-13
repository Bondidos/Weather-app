//
//  HourlyCarusel.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct HourlyForecastCarousel: View {
    let hourlyForecast: [HourlyForecastStateData]

    var body: some View {
        let itemWidth = UIScreen.main.bounds.width / 4
        let itemHeight = UIScreen.main.bounds.height / 4

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(hourlyForecast, id: \.self.id) { forecast in
                    HourlyWeatherItem(
                        time: forecast.time,
                        icon: forecast.icon,
                        description: forecast.description,
                        temperature: forecast.temp
                    ).padding()
                        .frame(width: itemWidth, height: itemHeight)
                }
            }
        }
    }
}
