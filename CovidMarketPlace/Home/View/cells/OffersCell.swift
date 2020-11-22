//
//  OffersCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

class OffersCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var offerLabel: UILabel!
    
    static let reuseIdentifier = "offers-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
