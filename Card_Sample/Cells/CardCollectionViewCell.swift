//
//  CardCollectionViewCell.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/4/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardView: CardView!

    var card: Card! {
        didSet {
            cardView.card = card
            layoutSubviews()
        }
    }
    
}
