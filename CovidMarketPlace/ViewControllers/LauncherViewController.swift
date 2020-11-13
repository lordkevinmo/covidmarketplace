//
//  ViewController.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 10/11/2020.
//

import UIKit

let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)

class LauncherViewController: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let landingPage = storyBoard.instantiateViewController(
                withIdentifier: LandingView.storyboardID) as! LandingView
            self.show(landingPage, sender: self)
        }
    }
}

