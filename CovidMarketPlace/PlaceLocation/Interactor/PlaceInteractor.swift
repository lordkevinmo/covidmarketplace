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
    var location: CLLocation! { get set }
    func viewDidLoad()
    func getMerchants()
    func getMerchants(by: CLLocation)
}

class PlaceInteractor: PlaceInteractorInput {
    var location: CLLocation!
    
    var output: PlaceInteractorOutput!
    
    init(location: CLLocation?) {
        registeredNotification()
        self.location = location
    }
    
    deinit {
        unregisteredNotification()
    }
    
    func viewDidLoad() {
        guard let currentLocation = location else {
            output.prepareView()
            return
        }
        getMerchants(by: currentLocation)
    }
    
    func getMerchants() {
        // Implement request to server to get the merchants data
        requestMerchants(for: location)
    }
    
    func getMerchants(by merchantLocation: CLLocation) {
        requestMerchants(for: merchantLocation)
    }
    
}

// MARK: - Methods
extension PlaceInteractor {
    private func requestMerchants(for location: CLLocation) {
        // Send requests to server
        output.yield(merchants: merchants)
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
            self.location = CLLocation(
                latitude: place.latitude!,
                longitude: place.longitude!
            )
        } else {
            output.locationFailed(with: "User failed to locate. Try Again")
        }
    }
}
