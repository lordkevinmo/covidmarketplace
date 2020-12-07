//
//  ProductPriceCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 01/12/2020.
//

import UIKit

class ProductPriceCell: UICollectionViewCell {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var discountPercent: UILabel!
    
    static let reuseIdentifier = "product-price-cell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
