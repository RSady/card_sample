//
//  SelectNumberOfCardsViewController.swift
//  Card_Sample
//
//  Created by Ryan Sady on 8/5/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import UIKit

class SelectNumberOfCardsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var cards = [Card]()
    var usersCard: Card?
    var numberOfCardsDisplayed: Int = { //This will change based on the iteration of the trick phase.
        return UserDefaults.standard.integer(forKey: "numberOfCards")
    }()
    var deck: Deck!
    var availableIndices: [Int] = Array()
    var selectedCards = [Card]()
    var selectedCardIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        availableIndices = Array(0..<numberOfCardsDisplayed)
        
        if let card = usersCard {
            titleLabel.text = "Select \(numberOfCardsDisplayed / 2) Cards"
            deck.remove(cards: [card]) //Remove the users card from the deck to prevent it from being shown twice
            populateCards()
        }
    }
    
    fileprivate func setupView() {
        //Init deck and shuffle it...assign delegates
        deck = Deck()
        deck.shuffleDeck()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func selectAction(_ sender: UIButton) {
        
    }
    
    fileprivate func populateCards() {
        guard !deck.cards.isEmpty else { print("Deck empty"); return } //Make sure deck isnt empty for any reason before pulling random index
        let randomCardIndex = Int.random(in: deck.cards.startIndex..<deck.cards.endIndex) //Gets a random cards index from the deck of available cards
        let randomCard = deck.cards[randomCardIndex] //Random card out of the deck based on the randomCardIndex
        let randomInsertIndex = Int.random(in: 0...cards.endIndex) //Random index to insert into the 'pile' of cards on the screen
        
        if cards.indices.contains(randomInsertIndex) {
            //If the current pile(array) of cards already has a card
            //at the selected randomInsertIndex, rerun function to generate
            //a new randomInsertIndex
            populateCards()
            return
        } else {
            if cards.count == numberOfCardsDisplayed {
                //If the card pile/array equals the number of cards that should be
                //shown on the screen insert the users card into a random spot,
                //reload the collectionView to show the users card then
                //exit out of the function.
                if let usersCard = usersCard {
                    cards[Int.random(in: 0..<numberOfCardsDisplayed)] = usersCard
                    collectionView.reloadData()
                }
                return
            } else {
                //The generated randomInsertIndex doesnt exist so insert
                //the random card into the pile/array of cards to be shown
                //and rerun the function to generate another card to insert
                cards.insert(randomCard, at: randomInsertIndex)
                collectionView.reloadData()
                deck.remove(cards: [randomCard])
                populateCards()
                return
            }
        }
    }

}

extension SelectNumberOfCardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionViewCell else { fatalError() }
        cell.cardView.frame = cell.frame
        cell.layer.cornerRadius = 10
        cell.card = cards[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell else { return }
        cell.layer.borderWidth = 2
        
        if cell.isSelected {
            cell.layer.borderColor = nil
            selectedCards.remove(at: selectedCardIndex)
            selectedCardIndex -= 1
        } else {
            cell.layer.borderColor = UIColor.black.cgColor
            selectedCards.append(cell.card)
            selectedCardIndex += 1
        }
        
        
    }
    
}
