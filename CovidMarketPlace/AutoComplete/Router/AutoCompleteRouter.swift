//
//  AutoCompleteRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 12/11/2020.
//

import UIKit

protocol AutoCompleteRouterInput: class {
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

class AutoCompleteRouter: NSObject, AutoCompleteRouterInput {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: AutoCompleteView.storyBoardID) as! AutoCompleteView
        let router = AutoCompleteRouter()
        router.viewController = view
        return view
    }
    
    
}
