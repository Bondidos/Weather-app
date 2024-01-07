//
//  AppResText.swift
//  Weather app
//
//  Created by Vladimir on 29.12.23.
//

import SwiftUI

struct AppResText: View {
    init(_ stringRes: Strings) {
        self.stringRes = stringRes
    }
    
    let stringRes: Strings
    
    var body: some View {
        Text(stringRes.rawValue)
    }
}

#Preview {
    AppResText(.CheckConnection)
}
