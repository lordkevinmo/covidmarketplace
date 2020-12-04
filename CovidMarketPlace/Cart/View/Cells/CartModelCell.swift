//
//  CartModelCell.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

class CartModelCell: UITableViewCell {
    @IBOutlet weak var cartModelName: UILabel!
    @IBOutlet weak var message: UILabel!
    
    static let reuseIdentifier = "cart-model-cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Methods
extension CartModelCell {
    private func setupViews() {
        message.isHidden = true
    }
    
    func populateView(with model: Model) {
        cartModelName.text = model.name
    }
}
