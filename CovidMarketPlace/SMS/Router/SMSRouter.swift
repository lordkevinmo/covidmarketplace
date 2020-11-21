//
//  SMSRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol SMSRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToLocation()
    static func assembleModule(with: String) -> UIViewController
}

class SMSRouter: NSObject, SMSRouterInput {
    var viewController: UIViewController?
    
    func redirectToLocation() {
        let view = PlaceRouter.assembleModule()
        viewController?.show(view, sender: self)
    }
    
    static func assembleModule(with phoneNumber: String) -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: SMSVerificationView.storyboardID) as! SMSVerificationView
        let presenter = SMSPresenter()
        let interactor = SMSInteractor(phoneNumber)
        let router = SMSRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
