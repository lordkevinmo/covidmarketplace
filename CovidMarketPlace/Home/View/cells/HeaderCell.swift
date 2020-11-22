//
//  HeaderCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 22/11/2020.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var expandBtn: UIButton!
    
    static let reuseIdentifier = "header-cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func expandBtnDidTapped(_ sender: UIButton) {
        
    }
    
}
