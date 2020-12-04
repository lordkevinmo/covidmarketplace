//
//  CartRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

protocol CartPreviewRouterInput: class {
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

class CartPreviewRouter: NSObject, CartPreviewRouterInput {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: CartPreview.storyboardID) as! CartPreview
        view.modalPresentationStyle = .formSheet
        return view
    }
}
