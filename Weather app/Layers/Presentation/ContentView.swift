//
//  ContentView.swift
//  Weather app
//
//  Created by Vladimir on 29.12.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainScreen(mainScreenState: MainScreenState(nil, .error))
    }
}

#Preview {
    ContentView()
}

