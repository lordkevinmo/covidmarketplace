//
//  ProductsCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 29/11/2020.
//

import UIKit

class ProductsCell: UICollectionViewCell {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var categoryDetails: UILabel!
    @IBOutlet weak var offerPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var attribute: UILabel!
    
    static let reuseIdentifier = "products-cell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Methods
extension ProductsCell {
    func populateProduct(product: Product) {
        productName.text = product.productName
        categoryDetails.text = product.productDetails
        price.text = "\(product.price!) €"
        attribute.text = "\(product.attribut!)"
    }
}
