//
//  DateView.swift
//  Weather app
//
//  Created by Vladimir on 7.01.24.
//

import SwiftUI

struct DateView: View {
    let date: String
    
    var body: some View {
        Text(date)
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(.white)
        
    }
}

#Preview {
    DateView(date: "Sat, Jan 6")
}
