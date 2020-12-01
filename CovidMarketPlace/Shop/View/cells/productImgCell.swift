//
//  productImgCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 01/12/2020.
//

import UIKit

class productImgCell: UICollectionViewCell {
    @IBOutlet weak var productImg: UIImageView!
    
    static let reuseIdentifier = "product-img-cell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
