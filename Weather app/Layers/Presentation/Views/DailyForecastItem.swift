//
//  DailyForecastItem.swift
//  Weather app
//
//  Created by Vladimir on 7.01.24.
//

import SwiftUI

struct DailyForecastItem: View {
    let date: String
    let description: String
    let icon: ImageResource
    let temp: String
    
    var body: some View {
        let itemWidth = UIScreen.main.bounds.width / 4
        
        HStack(alignment: .center) {
            Text(date)
                .frame(width: itemWidth)
            Spacer()
            VStack {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(description)
            }
            .frame(width: itemWidth)
            Spacer()
            Text(temp)
                .frame(width: itemWidth)
            
        }
        .font(.system(size: 16, weight: .regular))
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
}

#Preview {
    DailyForecastItem(
        date: "Tommorow Sun, Jan 7",
        description: "clear sky",
        icon: ._04N,
        temp: "47\u{00B0}/41\u{00B0}"
    )
    .background(.black)
}
