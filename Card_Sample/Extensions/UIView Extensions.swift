//
//  UIView Extensions.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/4/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(cornerRadius: CGFloat, color: UIColor) {
        //Corner Radius
        self.layer.cornerRadius = cornerRadius
        
        //Border
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
        //Ads Shadow
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4
    }
}
