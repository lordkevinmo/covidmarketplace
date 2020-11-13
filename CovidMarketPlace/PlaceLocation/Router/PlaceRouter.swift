//
//  PlaceRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol PlaceRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToHome()
    static func assembleModule() -> UIViewController
}

class PlaceRouter: NSObject, PlaceRouterInput {
    var viewController: UIViewController?
    
    func redirectToHome() {
        // Implement redirection to home screen
    }
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: PlaceView.storyboardID) as! PlaceView
        let presenter = PlacePresenter()
        let interactor = PlaceInteractor()
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
