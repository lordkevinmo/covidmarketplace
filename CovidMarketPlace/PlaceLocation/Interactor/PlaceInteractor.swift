//
//  PlaceInteractor.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation
import CoreLocation

protocol PlaceInteractorOutput: class {
    func renderUser(address: String)
    func locationFailed(with: String)
    func yield(address: String)
    func prepareView()
}

protocol PlaceInteractorInput: class {
    var output: PlaceInteractorOutput! { get set }
    var location: CLLocation! { get set }
    func viewDidLoad()
    func requestLocation()
}

class PlaceInteractor: PlaceInteractorInput {
    private var manager: LocationManager!
    
    var location: CLLocation!
    
    var output: PlaceInteractorOutput!
    
    init() {
        registeredNotification()
    }
    
    deinit {
        unregisteredNotification()
    }
    
    func viewDidLoad() {
        output.prepareView()
    }
    
    func requestLocation() {
        manager = LocationManager()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            [unowned self] in
            guard let location = self.manager.exposedLocation else {
                self.output.locationFailed(
                    with: "++Something went wrong when we were getting your location. Try again :(")
                return
            }
            
            self.location = location
            
            self.manager.getPlace(for: location) {[unowned self] place in
                guard let place = place else {
                    self.output.locationFailed(
                        with: "--Something went wrong when we were getting your location. Try again :(")
                    return
                }
                self.output.yield(address: place)
            }
        }
    }
    
}

// MARK: - Methods
extension PlaceInteractor {
    private func registeredNotification() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(hasReceivedPlaceNotification(_:)),
            name: .didPlaceAutocompleted, object: nil
        )
    }
    
    private func unregisteredNotification() {
        NotificationCenter.default.removeObserver(
            self, name: .didPlaceAutocompleted, object: nil
        )
    }
    
    @objc func hasReceivedPlaceNotification(_ notification: Notification) {
        if let place = notification.userInfo?[String.autocompleteplace] as? AutoComplete {
            let addressString = "\(place.address!) "
            output.renderUser(address: addressString)
            self.location = CLLocation(
                latitude: place.latitude!,
                longitude: place.longitude!
            )
        } else {
            output.locationFailed(with: "User failed to locate. Try Again")
        }
    }
}
