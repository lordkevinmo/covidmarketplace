//
//  ShopCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

class ShopCell: UICollectionViewCell {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var shopImg: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var reviewMark: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var priceTypeLabel: UILabel!
    @IBOutlet weak var shopAddress: UILabel!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    static let reuseIdentifier = "shop-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension ShopCell: HomePopulate {
    func populateView(with merch: Home) {
        let shop = merch as! Shop
        shopName.text = shop.companyName
        categoriesLabel.text = shop.category
        shopAddress.text = shop.address
    }
}
