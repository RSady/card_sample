//
//  Delegates.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/4/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import Foundation

///Adds the selected card into the existing deck of cards
protocol AddCardDelegate {
    func add(card: Card)
}
