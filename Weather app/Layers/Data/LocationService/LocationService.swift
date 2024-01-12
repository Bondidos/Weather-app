//
//  LocationService.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import CoreLocation
import Resolver

class LocationService: NSObject, CLLocationManagerDelegate {
    init(locationManager: CLLocationManager) {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private let locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    
    func getLatLong() -> LatLng? {
        let a = locationManager.location
        print(a)
        if let latlong = locationManager.location?.coordinate {
            return LatLng(latitude: latlong.latitude, longitude: latlong.longitude)
        }
        return nil
    }
}
