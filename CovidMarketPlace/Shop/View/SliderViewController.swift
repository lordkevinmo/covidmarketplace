//
//  SliderViewController.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

class SliderViewController: UIViewController {
    var sliderImage: UIImageView!
    
    var image: String?
    
    var index: Int
    
    init(with img: String! = nil, idx: Int) {
        self.image = img
        self.index = idx
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateView()
    }
}

// MARK: - Methods
extension SliderViewController {
    private func configVC() {
        view.backgroundColor = .systemBackground
        sliderImage = UIImageView()
        sliderImage.contentMode = .scaleAspectFill
        sliderImage.image = UIColor(named: "AccentColor")!.image()
        view.addSubview(sliderImage)
        sliderImage.frame = view.bounds
        sliderImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func populateView() {
        if let img = image {
            sliderImage.image = UIImage(named: img)
        }
    }
}
