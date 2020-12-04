//
//  Products.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 30/11/2020.
//

import Foundation

struct Product {
    let id = UUID()
    let productName: String?
    let productDetails: String?
    let discount: Double?
    let price: Double?
    let attribut: String?
}

extension Product: Equatable {
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct ProductGallery {
    let id = UUID()
    let image: String?
}

let productGallery: [ProductGallery] = [
    ProductGallery(image: "vegetables"),
    ProductGallery(image: "pasta"),
    ProductGallery(image: "food")
]

let products : [Product] = [
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - coupe cintrée", productDetails: "Polo",
        discount: nil, price: 44.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Jules",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Armani",
        discount: nil, price: 99.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Dior",
        discount: nil, price: 289.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "YSL",
        discount: nil, price: 299.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "JPG",
        discount: nil, price: 2990.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: ""),
    Product(
        productName: "Chemise - logo brodé", productDetails: "Lacoste",
        discount: nil, price: 29.99, attribut: "")
]
