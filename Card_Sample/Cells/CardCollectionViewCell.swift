//
//  CardCollectionViewCell.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/4/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topFaceValueLabel: UILabel!
    @IBOutlet weak var bottomFaceValueLabel: UILabel!
    @IBOutlet weak var topFaceValueIcon: UIImageView!
    @IBOutlet weak var bottomFaceValueIcon: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var suitImageView: UIImageView!
    
    var card: Card! {
        didSet {
            setupUpsidedownValues()
            topFaceValueIcon.image = card.suit.image
            bottomFaceValueIcon.image = card.suit.image
            topFaceValueLabel.text = card.abbreviatedDisplayValue
            bottomFaceValueLabel.text = card.abbreviatedDisplayValue
            suitImageView.image = card.suit.image
            cardView.addShadow(cornerRadius: 5, color: UIColor.black)
        }
    }
    
    fileprivate func setupUpsidedownValues() {
        bottomFaceValueIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        bottomFaceValueLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
    }
}
