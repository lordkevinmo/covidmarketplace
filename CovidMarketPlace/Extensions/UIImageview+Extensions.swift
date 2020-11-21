//
//  UIImageview+Extensions.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 19/11/2020.
//

import UIKit

extension UIImageView {
    
    func addOverlay(color: UIColor, alpha: CGFloat) {
        
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        overlay.backgroundColor = color
        overlay.tag = 1
        overlay.alpha = alpha
        
        // Check if overlay already exists before adding it
        if self.viewWithTag(1) == nil {
            self.addSubview(overlay)
        }
    }
    
}
