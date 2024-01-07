//
//  Description.swift
//  Weather app
//
//  Created by Vladimir on 7.01.24.
//

import SwiftUI

struct Description: View {
    let description: String
    
    var body: some View {
        Text(description)
            .font(.system(size: 27, weight: .medium))
            .foregroundStyle(.white)
    }
}

#Preview {
    Description(description: "clear sky")
}
