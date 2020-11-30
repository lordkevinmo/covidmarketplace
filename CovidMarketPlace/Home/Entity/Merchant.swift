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

protocol HomePopulate {
    func populateView(with : Home)
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

struct Brand: Home {
    var id: UUID = UUID()
    
    var type: UInt8 = 5
    
    let brand: UIImage!
}

extension Brand: Equatable {
    static func ==(lhs: Brand, rhs: Brand) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Brand: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Shop: Home {
    var id: UUID = UUID()
    
    var type: UInt8 = 6
    let companyName: String?
    let siren: Int?
    let address: String?
    let category: String?
    let city: String?
    let zipCode: Int?
    let open: Bool?
}

extension Shop: Equatable {
    static func ==(lhs: Shop, rhs: Shop) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Shop: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


let shops: [Shop] = [
    Shop(
        companyName: "City Market",
        siren: 883970527,
        address: "15 Rue de l'As Carreau",
        category: "Épicerie",
        city: "Belfort",
        zipCode: 90000, open: true),
    Shop(
        companyName: "Kalinka Magasin Russe",
        siren: 890852427,
        address: "10 Fbg de Montbéliard",
        category: "Épicerie",
        city: "Belfort",
        zipCode: 90000, open: true),
    Shop(
        companyName: "Cours des Halles",
        siren: 786543267,
        address: "67 Fbg de France",
        category: "Épicerie",
        city: "Belfort",
        zipCode: 90000, open: false),
    Shop(
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
    Category(categoryName: "Restaurant", image: UIImage(named: "dish")),
    Category(categoryName: "Sport", image: UIImage(named: "soccer")),
    Category(categoryName: "Textile", image: UIImage(named: "clothes"))
]

let adverts : [Ads] = [
    Ads(advert: UIImage(named: "black"))
]

let suggestions: [Suggestion] = [
    Suggestion(suggestion: "Pizza", image: #imageLiteral(resourceName: "pcmarket")),
    Suggestion(suggestion: "Poulet frît", image: #imageLiteral(resourceName: "kfc")),
    Suggestion(suggestion: "Viande de Boeufs", image: #imageLiteral(resourceName: "broken-heart")),
    Suggestion(suggestion: "Banane", image: #imageLiteral(resourceName: "pcmarket")),
    Suggestion(suggestion: "Burger", image: #imageLiteral(resourceName: "kfc"))
]

let offers: [Offers] = [
    Offers(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), offer: "All Offers"),
    Offers(color: #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1), offer: "-40% by Jules"),
    Offers(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), offer: "-15% by Vincent&Co"),
    Offers(color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), offer: "-10€ by Givenchy"),
    Offers(color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), offer: "-30€ by YFood"),
    Offers(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), offer: "-10% by Brice"),
    Offers(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), offer: "-30% by Cole Inc.")
]

let brands : [Brand] = [
    Brand(brand: #imageLiteral(resourceName: "carrefour")),
    Brand(brand: #imageLiteral(resourceName: "kfc")),
    Brand(brand: #imageLiteral(resourceName: "burgerking")),
    Brand(brand: #imageLiteral(resourceName: "brice"))
]
