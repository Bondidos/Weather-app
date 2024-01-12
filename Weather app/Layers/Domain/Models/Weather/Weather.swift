//
//  Weather.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
