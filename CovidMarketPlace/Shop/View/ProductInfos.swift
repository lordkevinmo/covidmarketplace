//
//  ProductInfos.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

class ProductInfos: UIViewController {
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var imgSlider: UIView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var displayedPrice: UILabel!
    @IBOutlet weak var crossedPrice: UILabel!
    @IBOutlet weak var paymentInfosTitle: UILabel!
    @IBOutlet weak var paymentInfos: UILabel!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionContent: UILabel!
    
    static let storyboardID = "product-infos"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
