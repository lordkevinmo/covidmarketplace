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
    
}

extension PlacePresenter: PlaceInteractorOutput {
    func yield(merchants: [Merchant]) {
        
    }
    
    func prepareView() {
        view?.placeIsSetup()
    }
}
