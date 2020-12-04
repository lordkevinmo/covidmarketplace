//
//  ProductView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 01/12/2020.
//

import UIKit

class ProductView: UIViewController {
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var container: UIView!
    
    static let storyboardID = "product-details-view"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHierarchy()
    }

    @IBAction func addToCart(_ sender: UIButton) {
    }
}

// MARK: Methods
extension ProductView {
    private func configHierarchy() {
        let pInfos = ProductInfosRouter.assembleModule()
        let pView = pInfos.view!
        addChild(pInfos)
        container.addSubview(pView)
        pView.frame = container.bounds
        pInfos.didMove(toParent: self)
    }
}
