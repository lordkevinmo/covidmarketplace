//
//  ShopHomeRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 28/11/2020.
//

import UIKit

protocol ShopHomeRouterInput: class {
    var viewController: UIViewController? { get set }
    static func assembleModule()-> UIViewController
}

class ShopHomeRouter: NSObject, ShopHomeRouterInput {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: ShopHome.storyboardID) as! ShopHome
        
        return view
    }
}

class ProductViewRouter: NSObject, ShopHomeRouterInput {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: ProductView.storyboardID) as! ProductView
        return view
    }
    
    
}
