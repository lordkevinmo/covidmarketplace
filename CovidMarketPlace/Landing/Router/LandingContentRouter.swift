//
//  LandingContentRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol LandingContentRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToLocation()
    static func assembleModule(with: Landings) -> UIViewController
}

class LandingContentRouter: NSObject, LandingContentRouterInput {
    var viewController: UIViewController?
    
    func redirectToLocation() {
        // Implement view redirection
        viewController?.show(
            LocationLauncherRouter.assembleModule(),
            sender: viewController.self)
    }
    
    static func assembleModule(with landing: Landings) -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: LandingContentView.storyboardID) as! LandingContentView
        let presenter = LandingContentPresenter()
        let interactor = LandingContentInteractor(landing)
        let router = LandingContentRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
