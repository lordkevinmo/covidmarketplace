//
//  FavoritesView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit

protocol FavoritesInput: class {
    func renderView(with: [Favorite])
}

class FavoritesView: UIViewController {
    
    static let storyboardID = "favorite-view"
    
    var favorites: [Favorite]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension FavoritesView: FavoritesInput {
    func renderView(with favorites: [Favorite]) {
        
    }
}
