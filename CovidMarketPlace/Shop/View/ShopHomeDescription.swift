//
//  ShopHomeDescription.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 29/11/2020.
//

import UIKit

class ShopHomeDescription: UIViewController {
    
    enum Section {
        case main
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    //static let storyboardID = "shop-home-description"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
