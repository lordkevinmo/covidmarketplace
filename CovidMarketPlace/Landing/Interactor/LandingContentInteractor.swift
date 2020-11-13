//
//  LandingContentInteractor.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation

protocol LandingContentInteractorOutput: class {
    func yieldView(with : Landings)
}

protocol LandingContentInteractorInput: class {
    func viewDidLoad()
    var output: LandingContentInteractorOutput! { get set }
}

class LandingContentInteractor: LandingContentInteractorInput {
    var output: LandingContentInteractorOutput!
    
    var landing: Landings
    
    init(_ landing: Landings) {
        self.landing = landing
    }
    
    func viewDidLoad() {
        output.yieldView(with: landing)
    }
}
