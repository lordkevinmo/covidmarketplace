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
    let category: String?
    let city: String?
    let zipCode: Int?
    let open: Bool?
}


struct Category: Codable {
    let categoryName: String?
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
    Category(categoryName: "Épicerie"),
    Category(categoryName: "Jouets"),
    Category(categoryName: "Restaurant"),
    Category(categoryName: "Sport"),
    Category(categoryName: "Textile")
]
