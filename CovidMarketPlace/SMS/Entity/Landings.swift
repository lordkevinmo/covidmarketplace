//
//  Landings.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

struct Page {
    let title: String?
    let message: String?
    let image: UIImage?
    let callAction: String?
}

enum Landings: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    
    var page: Page {
        switch self {
        case .pageZero:
            return Page(title: "PURCH'nTAKE", message: "Welcome to your marketplace. Let's shop!", image: #imageLiteral(resourceName: "pcmarket"), callAction: "Continue")
        case .pageOne:
            return Page(title: "PURCHASE", message: "Find your favorite store, and book your goods", image: #imageLiteral(resourceName: "checkout"), callAction: "Continue")
        case .pageTwo:
            return Page(title: "COLLECT", message: "Then go out and collect your good safely", image: #imageLiteral(resourceName: "buy"), callAction: "Let's try together")
        }
    }
    
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        }
    }
}
