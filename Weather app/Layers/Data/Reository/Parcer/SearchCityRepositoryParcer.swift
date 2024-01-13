//
//  SearchCityRepositoryParcer.swift
//  Weather app
//
//  Created by Vladimir on 13.01.24.
//

import Foundation

class SearchCityRepositoryParcer {
    func toCityList(source: Array<Any>) -> Array<City> {
        return source.enumerated().map { index, item in
            let castedItem = item as! Dictionary<String, Any>
            return City(
                id: index,
                name: castedItem["name"] as! String,
                country: castedItem["country"] as! String,
                latlong: LatLng(
                    latitude: castedItem["lat"] as! Double,
                    longitude: castedItem["lon"] as! Double
                )
            )
        }
    }
}
