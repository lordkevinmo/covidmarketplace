//
//  AuthPresenter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import Foundation

protocol AuthPresenterInput: class {
    var view: AuthInput? { get set }
    var interactor: AuthInteractorInput! { get set }
    var router: AuthRouterInput! { get set }
    func viewDidLoad()
    func requestAuth(for : String)
    func requestTerms()
    func sendToLocation()
}

class AuthPresenter: AuthPresenterInput {
    var view: AuthInput?
    
    var interactor: AuthInteractorInput!
    
    var router: AuthRouterInput!
    
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func requestAuth(for phoneNumber: String) {
        interactor.requestAuth(with: phoneNumber)
    }
    
    func requestTerms() {
        router.openTerms()
    }
    
    func sendToLocation() {
        router.redirectToLocation()
    }
    
}

extension AuthPresenter: AuthInteractorOutput {
    func initView() {
        view?.viewIsInit()
    }
    
    func waitForAuth(for phoneNumber: String) {
        router.redirectToSMSConfirmation(with: phoneNumber)
    }
    
    func throwError(_ error: String) {
        view?.throwError(msg: error)
    }
    
}
