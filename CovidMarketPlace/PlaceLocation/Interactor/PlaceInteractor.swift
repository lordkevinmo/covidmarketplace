//
//  PlaceInteractor.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation
import CoreLocation

protocol PlaceInteractorOutput: class {
    func yield(merchants: [Merchant])
    func renderUser(address: String)
    func locationFailed(with: String)
    func prepareView()
}

protocol PlaceInteractorInput: class {
    var output: PlaceInteractorOutput! { get set }
    func viewDidLoad()
    func getMerchants(by: CLLocation)
}

class PlaceInteractor: PlaceInteractorInput {
    var output: PlaceInteractorOutput!
    
    private var manager: LocationManager
    
    init() {
        manager = LocationManager()
        registeredNotification()
    }
    
    deinit {
        unregisteredNotification()
    }
    
    func viewDidLoad() {
        if let location = manager.exposedLocation {
            getMerchants(by: location)
        } else {
            output.prepareView()
        }
    }
    
    func getMerchants(by location: CLLocation) {
        // Implement request to server to get the merchants data
        requestMerchants(for: location)
    }
    
}

// MARK: - Methods
extension PlaceInteractor {
    private func requestMerchants(for location: CLLocation) {
        // Send requests to server
    }
    
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
            let addressString = "\(place.address!) \(place.postalCode!)"
            output.renderUser(address: addressString)
            let location = CLLocation(latitude: place.latitude!, longitude: place.longitude!)
        } else {
            output.locationFailed(with: "User failed to locate. Try Again")
        }
    }
}
