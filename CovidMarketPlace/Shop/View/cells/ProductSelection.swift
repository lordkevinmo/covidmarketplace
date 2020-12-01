//
//  ProductSelection.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 01/12/2020.
//

import UIKit

class ProductSelection: UICollectionViewCell {
    @IBOutlet weak var modelSelector: UISwitch!
    @IBOutlet weak var modelName: UILabel!
    
    static let reuseIdentifier = "product-selection"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func selectorIsChose(_ sender: UISwitch) {
        
    }
}
