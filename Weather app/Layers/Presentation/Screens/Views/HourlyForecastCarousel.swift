//
//  HourlyCarusel.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct HourlyForecastCarousel: View {
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
