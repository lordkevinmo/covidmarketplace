//
//  ProductView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 01/12/2020.
//

import UIKit

fileprivate let ITEM_IMAGE: [Int] = [0]
fileprivate let ITEM_TITLE: [Int] = [1]
fileprivate let ITEM_PRICE: [Int] = [2]
fileprivate let ITEM_SELECTOR: [Int] = [3]
fileprivate let ITEM_DESCRIPTION: [Int] = [4]

class ProductView: UIViewController {
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var container: UIView!
    
    static let storyboardID = "product-details-view"
    
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addToCart(_ sender: UIButton) {
    }
}

// MARK: Methods
extension ProductView {
    private func configHierarchy() {
        
    }
}
