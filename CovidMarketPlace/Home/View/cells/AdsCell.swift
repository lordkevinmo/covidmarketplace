//
//  AdsCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

class AdsCell: UICollectionViewCell {
    @IBOutlet weak var adsImage: UIImageView!
    
    static let reuseIdentifier = "ads-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
