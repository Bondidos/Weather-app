//
//  DailiForecastList.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct DailyForecstList: View {
    let dailyForecast: [DailyForecastStateData]
    
   var body: some View {
       ForEach(dailyForecast ,id: \.self.id) { forecast in
           DailyForecastItem(
            date: forecast.date,
            description: forecast.description,
            icon: forecast.icon,
            temp: forecast.temp
           )
           Divider()
       }
   }
}
