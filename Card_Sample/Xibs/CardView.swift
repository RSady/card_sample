//
//  CardView.swift
//  Card_Sample
//
//  Created by Ryan Sady on 8/4/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import UIKit

class CardView: UIView {

    @IBOutlet weak var containerView: CardView!
    @IBOutlet weak var suitImageView: UIImageView!
    @IBOutlet weak var topFaceValueIcon: UIImageView!
    @IBOutlet weak var bottomFaceValueIcon: UIImageView!
    @IBOutlet weak var topFaceValueLabel: UILabel!
    @IBOutlet weak var bottomFaceValueLabel: UILabel!
    
    var card: Card! {
        didSet {
            setupCard(card: card)
        }
    }
    
    init(frame: CGRect, card: Card) {
        self.card = card
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0 {
            commonInit()
        }
    }
    
    fileprivate func commonInit() {
        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        guard let containerView = containerView else { print("No Container View"); return }
        self.addSubview(containerView)
    }

    fileprivate func setupCard(card: Card) {
        //Assigns all of the cards values to the UI elements
        suitImageView.image = card.suit.image
        topFaceValueIcon.image = card.suit.image
        bottomFaceValueIcon.image = card.suit.image
        topFaceValueLabel.text = card.abbreviatedDisplayValue
        bottomFaceValueLabel.text = card.abbreviatedDisplayValue
        suitImageView.image = card.suit.image
        
        //Flips the bottom part of the cards face value and suit upside down
        bottomFaceValueIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        bottomFaceValueLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
    }

}
