//
//  GoodSuggestionCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

class GoodSuggestionCell: UICollectionViewCell {
    @IBOutlet weak var goodImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    static let reuseIdentifier = "suggestion-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension GoodSuggestionCell: HomePopulate {
    func populateView(with good: Home) {
        let sugg = good as! Suggestion
        goodImage.image = sugg.image
        categoryName.text = sugg.suggestion
    }
    
    
}
