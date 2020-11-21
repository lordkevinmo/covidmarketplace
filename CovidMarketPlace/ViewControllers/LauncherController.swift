//
//  LauncherController.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 20/11/2020.
//

import UIKit

let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)

class LauncherController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.show(AuthRouter.assembleModule(), sender: self)
        }
    }
}
