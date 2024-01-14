//
//  City.swift
//  Weather app
//
//  Created by Vladimir on 31.12.23.
//

import Foundation

struct City: Identifiable, Equatable, Hashable {
    static func == (lhs: City, rhs: City) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let country: String
    let latlong: LatLng
    
    func hash (into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(country)
        hasher.combine(latlong.latitude)
        hasher.combine(latlong.longitude)
    }
}
