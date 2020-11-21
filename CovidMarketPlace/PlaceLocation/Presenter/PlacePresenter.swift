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
    func requestLocation()
    func launchLocationSettings()
    func redirectToHome(with: String)
}

class PlacePresenter: PlacePresenterInput {
    var view: PlaceViewInput?
    
    var interactor: PlaceInteractorInput!
    
    var router: PlaceRouterInput!
    
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func requestLocation() {
        interactor.requestLocation()
    }
    
    func launchLocationSettings() {
        router.requestLocation()
    }
    
    func redirectToHome(with address: String) {
        router.redirectToHome(with: address)
    }
}

extension PlacePresenter: PlaceInteractorOutput {
    func yield(address: String) {
        router.redirectToHome(with: address)
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
