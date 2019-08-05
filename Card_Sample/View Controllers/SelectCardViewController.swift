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
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var continueButton: UIButton!
    

    var deck = Deck()
    var selectedCard: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        //Checks if the user selected a card and alerts them if they havent
        guard let _ = selectedCard else {
            showError(message: "Please select a card.")
            return
        }
        performSegue(withIdentifier: "selectNumberOfCards", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectNumberOfCards" {
            if let destination = segue.destination as? SelectNumberOfCardsViewController, let card = selectedCard {
                destination.usersCard = card
                destination.deck = deck
            }
        }
    }
    
}

extension SelectCardViewController {
    fileprivate func setupView() {
        //Setup Card and its view
        cardView.card = deck.cards[0]
        cardView.containerView.frame = cardView.bounds
        cardView.clipsToBounds = true
        
        //Sets up the pickerView and selects the first card in the deck
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.delegate?.pickerView?(pickerView, didSelectRow: 0, inComponent: 0)
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
        cardView.card = deck.cards[row]
    }
}
