//
//  BrandInsightCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

class BrandInsightCell: UICollectionViewCell {
    @IBOutlet weak var brandLogo: UIImageView!
    
    static let reuseIdentifier = "brand-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension BrandInsightCell: HomePopulate {
    func populateView(with brand: Home) {
        let brand = brand as! Brand
        brandLogo.image = brand.brand
    }
}
