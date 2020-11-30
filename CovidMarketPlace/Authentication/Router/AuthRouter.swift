//
//  AuthRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

protocol AuthRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToLocation()
    func redirectToSMSConfirmation(with : String)
    func openTerms()
    static func assembleModule() -> UIViewController
}

class AuthRouter: NSObject, AuthRouterInput {
    var viewController: UIViewController?
    
    func redirectToLocation() {
        let view = PlaceRouter.assembleModule()
        viewController?.show(view, sender: self)
    }
    
    func redirectToSMSConfirmation(with phoneNumber: String) {
        let view = SMSRouter.assembleModule(with: phoneNumber)
        viewController?.navigationController?.present(
            view, animated: true, completion: nil)
    }
    
    func openTerms() {
        
    }
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: AuthView.storyboardID) as! AuthView
        let presenter = AuthPresenter()
        let interactor = AuthInteractor()
        let router = AuthRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
    
    
}
