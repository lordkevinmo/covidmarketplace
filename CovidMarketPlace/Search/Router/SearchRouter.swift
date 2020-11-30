//
//  SearchRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 24/11/2020.
//

import UIKit

protocol SearchRouterInput: class {
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

