//
//  SelectCardViewController.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/3/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import UIKit

class SelectCardViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var suitImageView: UIImageView!
    @IBOutlet weak var topFaceValueLabel: UILabel!
    @IBOutlet weak var bottomFaceValueLabel: UILabel!
    @IBOutlet weak var topFaceValueIcon: UIImageView!
    @IBOutlet weak var bottomFaceValueIcon: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    var deck = Deck()
    var selectedCard: Card?
    var addCardDelegate: AddCardDelegate?
    var cardsToRemove: [Card]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        if let cards = cardsToRemove {
            deck.remove(cards: cards)
            pickerView.reloadAllComponents()
        }
    }
    
    fileprivate func setupView() {
        //Sets up the pickerView and selects the first card in the deck
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.delegate?.pickerView?(pickerView, didSelectRow: 0, inComponent: 0)
        cardView.addShadow(cornerRadius: 10, color: UIColor.black)
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


    @IBAction func continueAction(_ sender: UIButton) {
        
        //Checks if the user selected a card and alerts them if they havent
        guard let card = selectedCard else {
            showError(message: "Please select a card.")
            return
        }
        
        //Sends the card to the previous screen to be added
        //to be added to their selected cards
        addCardDelegate?.add(card: card)
        navigationController?.popViewController(animated: true)

    }
    
}

extension SelectCardViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return deck.cards.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return deck.cards[row].displayValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCard = deck.cards[row]
        setupCard(card: deck.cards[row])
    }
}
