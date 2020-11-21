//
//  MainViewController.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit

class MainViewController: UITabBarController {
    
    static let storyboardID = "main-controller"
    
    var address: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.unselectedItemTintColor = UIColor(named: .colorPrimary)
        if let nav = self.viewControllers?.first as? UINavigationController {
            let home = nav.topViewController as! HomeView
            home.address = address
//            selectedIndex = .HOMEBAR
        }
    }
}
