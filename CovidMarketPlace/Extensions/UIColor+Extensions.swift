//
//  UIColor+Extensions.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//
import UIKit

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
