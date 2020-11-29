//
//  ShopCategory.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 29/11/2020.
//

import Foundation

struct ShopCategory {
    let category: String
    var isExpanded:Bool = true
    let subCategories: [Category]
}
