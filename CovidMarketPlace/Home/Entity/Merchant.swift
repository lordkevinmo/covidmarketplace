//
//  Merchant.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 12/11/2020.
//

import Foundation

struct Merchant: Codable {
    let companyName: String?
    let siren: Int?
    let address: String?
    let city: String?
    let zipCode: String?
    let open: Bool?
}


struct Category: Codable {
    let categoryName: String?
}
