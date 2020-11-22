//
//  Merchant.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 12/11/2020.
//

import UIKit

protocol Home {
    var id: UUID { get set }
    var type: UInt8 { get set }
}

struct Ads: Home {
    var id: UUID = UUID()
    var type: UInt8 = 1
    let advert: UIImage!
}

extension Ads: Equatable {
    static func ==(lhs: Ads, rhs: Ads) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Ads: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let adverts : [Ads] = [
    Ads(advert: UIImage(named: "black"))
]

/* -----------------------------------------------------*/

struct Category: Home {
    var id: UUID = UUID()
    
    var type: UInt8 = 2
    
    let categoryName: String?
    let image: UIImage!
}

extension Category: Equatable {
    static func ==(lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Category: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Suggestion: Home {
    var id: UUID = UUID()
    
    var type: UInt8 = 3
    
    let suggestion: String?
    let image: UIImage!
}

extension Suggestion: Equatable {
    static func ==(lhs: Suggestion, rhs: Suggestion) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Suggestion: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Offers: Home {
    var id: UUID = UUID()
    
    var type: UInt8 = 4
    
    let color: UIColor!
    let offer: String!
}

extension Offers: Equatable {
    static func ==(lhs: Offers, rhs: Offers) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Offers: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Merchant: Codable {
    let companyName: String?
    let siren: Int?
    let address: String?
    let category: String?
    let city: String?
    let zipCode: Int?
    let open: Bool?
}


let merchants: [Merchant] = [
    Merchant(
        companyName: "City Market",
        siren: 883970527,
        address: "15 Rue de l'As Carreau",
        category: "Épicerie",
        city: "Belfort",
        zipCode: 90000, open: true),
    Merchant(
        companyName: "Kalinka Magasin Russe",
        siren: 890852427,
        address: "10 Fbg de Montbéliard",
        category: "Épicerie",
        city: "Belfort",
        zipCode: 90000, open: true),
    Merchant(
        companyName: "Cours des Halles",
        siren: 786543267,
        address: "67 Fbg de France",
        category: "Épicerie",
        city: "Belfort",
        zipCode: 90000, open: false),
    Merchant(
        companyName: "Restaurant Arizona",
        siren: 675439087,
        address: "Centre commercial des 4 As",
        category: "Restaurant",
        city: "Belfort",
        zipCode: 90000, open: true)
]

let categories: [Category] = [
    Category(categoryName: "Florist", image: UIImage(named: "flower")),
    Category(categoryName: "Toys", image: UIImage(named: "clip-travel")),
    Category(categoryName: "Restaurant", image: UIImage(named: "flower")),
    Category(categoryName: "Sport", image: UIImage(named: "flower")),
    Category(categoryName: "Textile", image: UIImage(named: "flower"))
]
