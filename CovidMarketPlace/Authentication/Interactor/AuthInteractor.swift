//
//  AuthInteractor.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import Foundation

protocol AuthInteractorOutput: class {
    func initView()
    func waitForAuth(for: String)
    func throwError(_:String)
}

protocol AuthInteractorInput: class {
    var output: AuthInteractorOutput! { get set }
    func viewDidLoad()
    func requestAuth(with: String)
}

class AuthInteractor: AuthInteractorInput {
    var output: AuthInteractorOutput!
    
    func viewDidLoad() {
        output.initView()
    }
    
    func requestAuth(with phone: String) {
        authUser(by: phone)
    }
    
}

extension AuthInteractor {
    private func authUser(by number: String) {
        // Logic for authentication
        
        // send back the response
        output.waitForAuth(for: number)
    }
}
