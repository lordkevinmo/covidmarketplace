//
//  SMSPresenter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation

protocol SMSPresenterInput: class {
    var view: SMSVerificationInput? { get set }
    var interactor: SMSInteractorInput! { get set }
    var router: SMSRouterInput! { get set }
    func viewDidLoad()
    func showLocation()
}

class SMSPresenter: SMSPresenterInput {
    var view: SMSVerificationInput?
    
    var interactor: SMSInteractorInput!
    
    var router: SMSRouterInput!
    
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func showLocation() {
        router.redirectToLocation()
    }
}

extension SMSPresenter: SMSInteractorOutput {
    func yieldView(with phone: String) {
        view?.initView(with: phone)
    }
}
