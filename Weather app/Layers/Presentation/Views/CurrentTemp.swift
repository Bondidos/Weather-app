//
//  CurrentTemp.swift
//  Weather app
//
//  Created by Vladimir on 7.01.24.
//

import SwiftUI

struct CurrentTemp: View {
    let temp: String
    
    var body: some View {
        Text(temp)
            .font(.system(size: 60))
            .foregroundColor(.white)
            .fontWeight(.medium)
    }
}

#Preview {
    CurrentTemp(temp: "55")
}
