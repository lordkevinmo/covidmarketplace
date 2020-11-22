//
//  CategoryCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryIllustration: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    static let reuseIdentifier = "category-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}