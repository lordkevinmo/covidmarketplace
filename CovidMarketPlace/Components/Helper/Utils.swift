//
//  Utils.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

class Utils {
    var viewController : UIViewController
    
    init(_ viewController : UIViewController) {
        self.viewController = viewController
    }
    
    func showAlert(with title: String = "Erreur", message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController.present(alertVC, animated: true, completion: nil)
    }
    
    func throwTexField(_ field : UITextField) {
        field.layer.borderColor = CGColor(srgbRed: 200, green: 10, blue: 5, alpha: 1.0)
    }
    
    func showToast(withMessage message : String, seconds : Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 16
        
        viewController.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}

