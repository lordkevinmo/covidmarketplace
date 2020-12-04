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
        configureGallery()
        configLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateView()
    }
}

// MARK: Methods
extension ProductInfos {
    private func configureGallery() {
        let gallery = productGallery
        
        let galleryVC = GalleryView()
        galleryVC.sliderImageList = gallery
        
        addChild(galleryVC)
        
        let galleryView = galleryVC.view!
        
        imgSlider.addSubview(galleryView)
        
        galleryView.frame = imgSlider.bounds
        
        galleryVC.didMove(toParent: self)
    }
    
    private func configLabels() {
        paymentInfosTitle.text = "Payment infos"
        paymentInfos.text = "On site payment, Credit Card"
        descriptionTitle.text = "Product description"
    }
    
    func populateView() {
        let product = products.first!
        productTitle.text = product.productName
        displayedPrice.text = "\(product.price!) €"
        crossedPrice.text = "200 €".strikethrough.string
        descriptionContent.text = "A court Look revamped for the streets. \n Stripped-down sports style. Showing off a clean look, these tennis-inspired shoes have a smooth leather upper. Perforated 3-Stripes detail the sides. A cushioned sockliner brings comfort to every step."
    }
}
