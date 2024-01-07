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
            AppResText(.Days)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(.li))
    }
}

#Preview {
    MainScreen(
        mainScreenState: MainScreenState(nil, .error)
    )
}
