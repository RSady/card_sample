//
//  Card.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/3/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import Foundation

class Card: Equatable {
    let suit: Suit
    let faceValue: Int
    let displayValue: String
    let abbreviatedDisplayValue: String
    
    //Creates a new card and assigns the values based on the suit and face value of the card
    init(suit: Suit, faceValue: Int) {
        self.suit = suit
        self.faceValue = faceValue
        
        var value: String
        switch faceValue {
        case 1: value = "Ace"
        case 2...10: value = "\(faceValue)"
        case 11: value = "Jack"
        case 12: value = "Queen"
        case 13: value = "King"
        default: value = ""
        }
        
        self.displayValue = "\(value) of \(suit.rawValue)"
        self.abbreviatedDisplayValue = {
            if let valueStr = Int(value) {
                return "\(valueStr)"
            } else {
                guard let faceLetter = value.first else { return "" }
                return String(faceLetter)
            }
        }()
    }
    
    //Used for comparing cards to check if a card already exists in a deck, for example.
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.displayValue == rhs.displayValue
    }
    
    
}
