//
//  PlaceView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol PlaceViewInput: class {
    func placeIsSetup()
}

class PlaceView: UIViewController {
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var actionMessage: UILabel!
    @IBOutlet weak var placeTxtField: UITextField!
    @IBOutlet weak var actionBtn: UIButton!
    
    static let storyboardID = "place-view"
    
    var presenter: PlacePresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Show the loading spinner
        DispatchQueue.main.async { [unowned self] in
            self.view.showBlurLoader()
        }
        presenter.viewDidLoad()
    }
    
    @IBAction func actionBtnDidTapped(_ sender: UIButton) {
        if isValidateLocation() {
            
        } else {
            
        }
    }

    @IBAction func placeTxtfieldDidTouched(_ sender: UITextField) {
        sender.resignFirstResponder()
        let navigation = UINavigationController(
            rootViewController: AutoCompleteRouter.assembleModule())
        present(navigation, animated: true, completion: nil)
    }
}

// MARK: - Methods
extension PlaceView {
    private func isValidateLocation() -> Bool {
        return ((placeTxtField.text?.isEmpty) != nil)
    }
}

extension PlaceView: PlaceViewInput {
    func placeIsSetup() {
        // remove the loading spinner
        DispatchQueue.main.async { [unowned self] in
            self.view.removeBlurLoader()
        }
    }
}
