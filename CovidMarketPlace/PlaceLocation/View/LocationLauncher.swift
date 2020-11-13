//
//  LocationLauncher.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit
import CoreLocation

class LocationLauncher: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    static let storyboardID = "location-launcher"
    
    private var manager: LocationManager!
    
    var router: LocationLauncherRouterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = LocationManager()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        indicator.startAnimating()
        configLocationService()
    }
}

// MARK: - Methods
extension LocationLauncher {
    private func configLocationService() {
        requestLocation()
    }
    
    private func requestLocation() {
        DispatchQueue.main.async { [unowned self] in
            guard let location = self.manager.exposedLocation else {
                self.prepareForLocalization(for: nil)
                return
            }
            self.prepareForLocalization(for: location)
        }
    }
    
    private func prepareForLocalization(for location: CLLocation?) {
        DispatchQueue.main.async { [unowned self] in
            self.indicator.stopAnimating()
        }
        router.redirectToPlaceView(for: location)
    }
}
