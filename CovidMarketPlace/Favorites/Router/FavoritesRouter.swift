//
//  FavoritesRouter.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit

protocol FavoriteRouterInput: class {
    var viewController: UIViewController? { get set }
    func redirectToEmptyFavorite()
    static func assembleModule() -> UIViewController
}

class FavoriteRouter: FavoriteRouterInput {
    var viewController: UIViewController?
    
    func redirectToEmptyFavorite() {
        let emptyView = storyBoard.instantiateViewController(
            withIdentifier: FavoriteEmpty.storyboardID) as! FavoriteEmpty
        viewController?.show(emptyView, sender: viewController.self)
    }
    
    static func assembleModule() -> UIViewController {
        let view = storyBoard.instantiateViewController(
            withIdentifier: FavoritesView.storyboardID) as! FavoritesView
        
        return view
    }
}
