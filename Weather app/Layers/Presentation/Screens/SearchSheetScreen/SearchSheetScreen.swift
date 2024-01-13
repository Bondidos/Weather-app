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
            ScrollView {
                ForEach(viewModel.cities, id: \.self.id) { cityModel in
                    Button(action: {
                        viewModel.onTap(city: cityModel)
                    }, label: {
                        VStack (alignment: .leading) {
                            Text(cityModel.name)
                                .font(.title)
                                .foregroundColor(.white)
                            Text(cityModel.country)
                                .lineLimit(1)
                        }
                        .padding(.top, 10)
                    }).frame(alignment: .leading)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding([.leading,.trailing])
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.mainBlue)
    }
}

#Preview {
    SearchSheetScreen()
}
