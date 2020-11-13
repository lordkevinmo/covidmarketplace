//
//  LandingContentView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol LandingContentInput: class {
    func initView(with landing: Landings)
}

class LandingContentView: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var illustration: UIImageView!
    @IBOutlet weak var callActionBtn: UIButton!
    
    static let storyboardID = "landing-content"
    
    var landing: Landings!
    
    var presenter: LandingContentPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        presenter.viewDidLoad()
    }

    @IBAction func callActionBtnDidTap(_ sender: UIButton) {
        if landing.index == .two {
            presenter.showLocation()
        }
    }
}

// MARK: - Methods
extension LandingContentView {
    private func populateView(with landing: Landings) {
        DispatchQueue.main.async { [unowned self] in
            self.titleLabel.text = landing.page.title
            self.messageLabel.text = landing.page.message
            self.illustration.image = landing.page.image
            self.callActionBtn.setTitle(landing.page.callAction, for: .normal)
            if landing.index == .two {
                self.callActionBtn.isHidden = false
            }
        }
    }
    
    private func initView() {
        callActionBtn.layer.cornerRadius = 24
        self.callActionBtn.isHidden = true
    }
}

// MARK: - extends landing content view
extension LandingContentView: LandingContentInput {
    func initView(with landing: Landings) {
        self.landing = landing
        populateView(with: landing)
    }
    
}
