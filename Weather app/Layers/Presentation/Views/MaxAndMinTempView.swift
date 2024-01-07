//
//  MaxAndMinTempView.swift
//  Weather app
//
//  Created by Vladimir on 7.01.24.
//

import SwiftUI

struct MaxAndMinTempView: View {
    let max: String
    let min: String
    
    var body: some View {
        Text("\(max )\u{00B0}/\(min)\u{00B0}")
            .font(.title)
            .foregroundColor(.white)
            .fontWeight(.medium)
            
            
    }
}

#Preview {
    MaxAndMinTempView(
        max: "53",
        min: "41"
    )
}
