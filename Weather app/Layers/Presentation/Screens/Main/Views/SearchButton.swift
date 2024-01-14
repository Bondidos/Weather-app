//
//  SearchButton.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct SearchButton: View {
    @Binding var navStack: [ScreensStack]

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    navStack.append(.searchScreen)
                }, label: {
                    ZStack {
                        Circle()
                            .fill(.orange)
                            .shadow(radius: 10)
                            .frame(width: 50,height: 50)
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 30,height: 30)
                    }
                })
            }
        }
        .padding([.trailing], 20)
    }
}
