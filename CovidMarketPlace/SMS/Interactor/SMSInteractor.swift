//
//  SMSInteractor.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import Foundation

protocol SMSInteractorOutput: class {
    func yieldView(with : String)
}

protocol SMSInteractorInput: class {
    func viewDidLoad()
    var output: SMSInteractorOutput! { get set }
}

class SMSInteractor: SMSInteractorInput {
    var output: SMSInteractorOutput!
    
    var phone: String
    
    init(_ number: String) {
        phone = number
    }
    
    func viewDidLoad() {
        output.yieldView(with: phone)
    }
}
