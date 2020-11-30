//
//  ShopHomeCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 29/11/2020.
//

import UIKit

class ShopHomeCell: UITableViewCell {
    @IBOutlet weak var subCategoryLabel: UILabel!
    @IBOutlet weak var subCategoryImg: UIImageView!
    
    static let reuseIdentifier = "shop-home-cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
