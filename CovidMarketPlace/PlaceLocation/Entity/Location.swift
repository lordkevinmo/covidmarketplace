//
//  Location.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    private var locationManager: CLLocationManager
    
    var location : CLLocation!
    
    // Update the location data and return the value
    var exposedLocation: CLLocation? {
        return location
    }
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        // CLLocation manager configurations
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            locationManager.stopUpdatingLocation()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//        case .notDetermined:
//            manager.requestWhenInUseAuthorization()
//        case .restricted, .denied:
//            manager.stopUpdatingLocation()
//        case .authorizedAlways, .authorizedWhenInUse:
//            manager.startUpdatingLocation()
//        @unknown default:
//            manager.requestWhenInUseAuthorization()
//        }
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\(#function)")
        if let location = locations.first {
            self.location = location
        } else {
            print("\(#function): Failed")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error:: Get error \(error.localizedDescription)")
    }
}
