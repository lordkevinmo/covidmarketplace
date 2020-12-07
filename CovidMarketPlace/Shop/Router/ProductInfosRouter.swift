//
//  GalleryRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

protocol ProductInfosRouterInput: class {
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

class ProductInfosRouter: NSObject, ProductInfosRouterInput {
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: ProductInfos.storyboardID) as! ProductInfos
        let router = ProductInfosRouter()
        router.viewController = view
        return view
    }
}
