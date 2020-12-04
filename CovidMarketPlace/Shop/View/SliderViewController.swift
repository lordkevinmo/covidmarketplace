//
//  SliderViewController.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

class SliderViewController: UIViewController {
    var sliderImage: UIImageView!
    
    var image: UIImage?
    
    var index: Int
    
    init(with img: UIImage! = nil, idx: Int) {
        self.image = img
        self.index = idx
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
