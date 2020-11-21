//
//  HomeView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit

class HomeView: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var addressLabel: UIButton!
    
    static let storyboardID = "home-view"
    
    var address: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        addressLabel.setTitle(address, for: .normal)
    }

    @IBAction func addressIsRequested(_ sender: UIButton) {
        
    }
}
