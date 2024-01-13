//
//  SearchButton.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import SwiftUI

struct SearchButton: View {
    @State var isShowSearchSheet = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    isShowSearchSheet = true
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
                .sheet(isPresented: $isShowSearchSheet) {
                    SearchSheetScreen()
                }
            }
        }
        .padding([.trailing], 20)
    }
}
