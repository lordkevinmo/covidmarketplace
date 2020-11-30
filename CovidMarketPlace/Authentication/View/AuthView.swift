//
//  AuthView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 10/11/2020.
//

import UIKit

protocol AuthInput: class {
    func viewIsInit()
    func throwError(msg: String)
}

class AuthView: UIViewController {
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var msgLabel: UILabel!
    
    static let storyboardID = "auth-view"
    
    var utils: Utils!
    
    var presenter: AuthPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func skipBtnDidTapped(_ sender: UIButton) {
        presenter.sendToLocation()
    }
    
    @IBAction func sendBtnDidTapped(_ sender: UIButton) {
        process(phone: phoneTxtField.text)
    }
}

extension AuthView {
    /// add style to some view elements
    private func setupViews() {
        DispatchQueue.main.async {
            self.background.addOverlay(color: .systemGreen, alpha: 0.4)
            self.skipBtn.addcornerRadius(
                usingCorners: [.allCorners],
                cornerRadii: CGSize(width: 32, height: 32)
            )
            self.sendBtn.addcornerRadius(
                usingCorners: [.allCorners],
                cornerRadii: CGSize(width: 20, height: 20)
            )
        }
    }
    
    private func process(phone: String?) {
        guard let number = phone else {
            utils.showAlert(with: "Form error", message: "The phone number field can't be empty")
            return
        }
        
        guard number.count == 10 else {
            utils.showAlert(with: "Form error", message: "Wrong phone number form")
            return
        }
        
        presenter.requestAuth(for: number)
    }
}

extension AuthView: AuthInput {
    func viewIsInit() {
        utils = Utils(self)
        setupViews()
    }
    
    func throwError(msg: String) {
        utils.showAlert(message: msg)
    }
    
    
}
