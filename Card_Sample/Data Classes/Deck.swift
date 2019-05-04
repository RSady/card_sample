//
//  Deck.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/3/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card]
    
    ///Creates a new deck of 52 cards
    init() {
        var newDeck = [Card]()
        for suit in Suit.allCases {
            for value in 1...13 {
                newDeck.append(Card(suit: suit, faceValue: value))
            }
        }
        self.cards = newDeck
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func shuffleDeck() {
        self.cards.shuffle()
    }
    
    ///Prints out any of the available cards left in the deck.
    func displayAvailableCards() {
        self.cards.forEach({ (card) in
            print(card.displayValue)
        })
    }
    
    func remove(cards: [Card]) {
        for card in cards {
            self.cards.removeAll(where: { $0 == card} )
        }
    }
    
    func insert(card: Card) {
        self.cards.append(card)
    }
    
}
