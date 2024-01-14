//
//  SearchSheetScreen.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI
import RxSwift

struct SearchSheetScreen: View {
    @ObservedObject var viewModel = SearchSheetScreenViewModel()
    @State var city: String = ""
    @Binding var navStack: [ScreensStack]
    
    var body: some View {
        VStack {
            TextField(Strings.SearchCity.rawValue, text: $city)
                .onChange(of: city) {
                    viewModel.handleInput(text: city)
                }
                .textFieldStyle(.roundedBorder)
                .background(.white)
                .padding()
                .cornerRadius(5)
                .border(.white, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .shadow(radius: 5)
                .padding()
            List(viewModel.cities) { item in
                Button(item.name + " " + item.country) {
                    navStack.append(.cityWeather(item))
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.mainBlue)
        .scrollContentBackground(.hidden)
    }
}
