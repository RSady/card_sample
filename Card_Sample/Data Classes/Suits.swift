//
//  Suits.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/3/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import Foundation
import UIKit

enum Suit: String, CaseIterable {
    case diamonds = "Diamonds"
    case hearts = "Hearts"
    case spades = "Spades"
    case clubs = "Clubs"
    
    //Sets the corresponding image to each suit.  If no image is found, an empty image is returned.
    var image: UIImage {
        switch self {
        case .clubs:
            return UIImage(named: "clubs") ?? UIImage()
        case .diamonds:
            return UIImage(named: "diamonds") ?? UIImage()
        case .hearts:
            return UIImage(named: "hearts") ?? UIImage()
        case .spades:
            return UIImage(named: "spades") ?? UIImage()
        }
    }
}
