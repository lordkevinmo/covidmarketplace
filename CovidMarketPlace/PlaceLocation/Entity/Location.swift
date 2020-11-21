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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\(#function)")
        if let location = locations.last {
            self.location = location
        } else {
            print("\(#function): Failed")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error:: Get error \(error.localizedDescription)")
    }
}

// MARK: - Methods
extension LocationManager {
    
    func getPlace(for location: CLLocation, completion: @escaping(String?)->()) {
        //set the geocoder and use it with reverse geocode location method
        //to get the user location informations from CLPlacemark API
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            guard error == nil else {
                completion(nil)
                return
            }
            // get the place mark data
            guard let placemark = placemarks?[0] else {
                completion(nil)
                return
            }
            // Define placeholder value for unknown address
            var name : String = "Unknown"
            // Process address to reorder the city and the road.
            // The address comes in reverse order
            if let address = placemark.name {
                let subAddr = address.byWords
                let last = subAddr.last!
                var sublast = subAddr.dropLast()
                sublast.insert(last, at: 0)
                name = sublast.joined(separator: " ")
            }
            
            completion(name)
        }
    }

}
