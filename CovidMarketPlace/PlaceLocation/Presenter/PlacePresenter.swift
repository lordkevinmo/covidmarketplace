//
//  PlacePresenter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation
import CoreLocation

protocol PlacePresenterInput: class {
    var view: PlaceViewInput? { get set }
    var interactor: PlaceInteractorInput! { get set }
    var router: PlaceRouterInput! { get set }
    func viewDidLoad()
    func getMerchants(by: CLLocation)
    func getMerchants()
}

class PlacePresenter: PlacePresenterInput {
    var view: PlaceViewInput?
    
    var interactor: PlaceInteractorInput!
    
    var router: PlaceRouterInput!
    
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func getMerchants(by location: CLLocation) {
        interactor.getMerchants(by: location)
    }
    
    func getMerchants() {
        interactor.getMerchants()
    }
}

extension PlacePresenter: PlaceInteractorOutput {
    func yield(merchants: [Merchant]) {
        router.redirectToHome(with: merchants)
    }
    
    func prepareView() {
        view?.placeIsSetup()
    }
    
    func renderUser(address: String) {
        view?.addressIsYield(with: address)
    }
    
    func locationFailed(with error: String) {
        view?.errorIsThrown(with: error)
    }
}
