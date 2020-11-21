//
//  PlaceView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol PlaceViewInput: class {
    func placeIsSetup()
    func addressIsYield(with: String)
    func errorIsThrown(with: String)
}

class PlaceView: UIViewController {
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var requestLocationBtn: UIButton!
    @IBOutlet weak var manualLocationBtn: UIButton!
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    static let storyboardID = "place-view"
    
    var presenter: PlacePresenterInput!
    
    private var utils: Utils!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func locationDidRequested(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.indicator.isHidden = false
            self.indicator.startAnimating()
            self.requestLocationBtn.titleLabel?.isHidden = true
        }
        presenter.requestLocation()
    }
    
    @IBAction func manuallyLocationDidRequested(_ sender: UIButton) {
        presenter.launchLocationSettings()
    }
}

// MARK: - Methods
extension PlaceView {
    /**
     Simple Action Sheet
     - Show action sheet with title and alert message and actions
     */
    func showConfirmationAddress(for addr: String) {
        print("\(#function)")
        let alert = UIAlertController(
            title: "Confirm your location",
            message: addr,
            preferredStyle: .actionSheet
        )
        
        alert.addAction(UIAlertAction(title: "Approve", style: .default, handler: {
            [unowned self] (_) in
            self.presenter.redirectToHome(with: addr)
        }))

        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: {
            [unowned self] (_) in
            self.presenter.launchLocationSettings()
        }))

        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}

extension PlaceView: PlaceViewInput {
    func addressIsYield(with text: String) {
        self.dismiss(animated: true, completion: {
            DispatchQueue.main.async {
                self.showConfirmationAddress(for: text)
            }
        })
        
    }
    
    func errorIsThrown(with error: String) {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
            self.requestLocationBtn.titleLabel?.isHidden = false
        }
        
        utils.showAlert(message: error)
    }
    
    func placeIsSetup() {
        // Init the Utils data
        utils = Utils(self)
        indicator.hidesWhenStopped = true
    }
}
