//
//  PlaceRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit
import CoreLocation

protocol PlaceRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToHome(with: [Merchant])
    static func assembleModule(by: CLLocation?) -> UIViewController
}

class PlaceRouter: NSObject, PlaceRouterInput {
    var viewController: UIViewController?
    
    func redirectToHome(with merchants: [Merchant]) {
        // Implement redirection to home screen
        print("\(#function)")
        let controller = storyBoard.instantiateViewController(
            withIdentifier: MainViewController.storyboardID) as! MainViewController
        controller.merchants = merchants
        controller.selectedIndex = .HOMEBAR
        viewController?.show(controller, sender: viewController.self)
    }
    
    static func assembleModule(by location: CLLocation?) -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: PlaceView.storyboardID) as! PlaceView
        let presenter = PlacePresenter()
        let interactor = PlaceInteractor(location: location)
        let router = PlaceRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
