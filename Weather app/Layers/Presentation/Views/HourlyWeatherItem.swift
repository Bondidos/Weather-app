//
//  HourlyWeatherItem.swift
//  Weather app
//
//  Created by Vladimir on 7.01.24.
//

import SwiftUI

struct HourlyWeatherItem: View {
    let time: String
    let icon: ImageResource
    let description: String
    let temperature: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(time)
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(description)
            Spacer()
            Text(temperature)
        }
        .font(.system(size: 16, weight: .regular))
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
}

#Preview {
    HourlyWeatherItem(
        time: "04:00 PM",
        icon: ._02N,
        description: "few clouds",
        temperature: "47"
    )
    .background(.black)
    .frame(height: 280)
}
