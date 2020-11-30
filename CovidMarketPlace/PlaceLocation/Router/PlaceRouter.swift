//
//  PlaceRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol PlaceRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToHome(with: String)
    func requestLocation()
    static func assembleModule() -> UIViewController
}

class PlaceRouter: NSObject, PlaceRouterInput {
    var viewController: UIViewController?
    
    func requestLocation() {
        let nav = UINavigationController(rootViewController: AutoCompleteRouter.assembleModule())
        viewController?.navigationController?.present(nav, animated: true, completion: nil)
    }
    
    func redirectToHome(with addr: String) {
        // Implement redirection to home screen
        let controller = storyBoard.instantiateViewController(
            withIdentifier: MainViewController.storyboardID) as! MainViewController
        controller.address = addr
        controller.selectedIndex = .HOMEBAR
        viewController?.show(controller, sender: self)
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
