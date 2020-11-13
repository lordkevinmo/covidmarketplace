//
//  LandingContentPresenter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation

protocol LandingContentPresenterInput: class {
    var view: LandingContentInput? { get set }
    var interactor: LandingContentInteractorInput! { get set }
    var router: LandingContentRouterInput! { get set }
    func viewDidLoad()
    func showLocation()
}

class LandingContentPresenter: LandingContentPresenterInput {
    var view: LandingContentInput?
    
    var interactor: LandingContentInteractorInput!
    
    var router: LandingContentRouterInput!
    
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func showLocation() {
        router.redirectToLocation()
    }
}

extension LandingContentPresenter: LandingContentInteractorOutput {
    func yieldView(with landing: Landings) {
        view?.initView(with: landing)
    }
}
