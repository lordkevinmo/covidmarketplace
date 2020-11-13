//
//  MainViewController.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit

class MainViewController: UITabBarController {
    
    static let storyboardID = "main-controller"
    
    var merchants: [Merchant]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.unselectedItemTintColor = UIColor(named: .colorPrimary)
    }
}
