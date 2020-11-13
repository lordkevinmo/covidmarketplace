//
//  LocationLauncherRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit
import CoreLocation

protocol LocationLauncherRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToPlaceView(for: CLLocation?)
    static func assembleModule() -> UIViewController
}

class LocationLauncherRouter: NSObject, LocationLauncherRouterInput {
    var viewController: UIViewController?
    
    func redirectToPlaceView(for location: CLLocation?) {
        viewController?.show(
            PlaceRouter.assembleModule(by: location),
            sender: viewController.self)
    }
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: LocationLauncher.storyboardID) as! LocationLauncher
        let router = LocationLauncherRouter()
        view.router = router
        router.viewController = view
        return view
    }
}
