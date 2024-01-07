//
//  Title.swift
//  Weather app
//
//  Created by Vladimir on 7.01.24.
//

import SwiftUI

struct Title: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 36,weight: .bold))
            .foregroundStyle(.white)
    }
}

#Preview {
    Title(title: "Mountain View")
}
