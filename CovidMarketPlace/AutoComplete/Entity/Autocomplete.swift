//
//  Autocomplete.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 12/11/2020.
//

import Foundation

struct AutoComplete : Codable{
    var address: String? = nil
    var latitude: Double? = nil
    var longitude: Double? = nil
    var country: String? = nil
    var locality: String? = nil
    var postalCode: String? = nil
    var isoCode: String? = nil
}

