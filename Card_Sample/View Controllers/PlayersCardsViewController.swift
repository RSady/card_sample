//
//  PlayersCardsViewController.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/3/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import UIKit

class PlayersCardsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addCardButton: UIButton!
    
    var selectedCard: Card?
    var deck = Deck(cards: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    
    @IBAction func addCardAction(_ sender: UIButton) {
        performSegue(withIdentifier: "selectCard", sender: self)
    }
    
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectCard" {
            if let destination = segue.destination as? SelectCardViewController {
                destination.addCardDelegate = self
                destination.cardsToRemove = deck.cards
            }
        }
    }
    
}

extension PlayersCardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionViewCell else { fatalError() }
        cell.card = deck.cards[indexPath.item]
        return cell
    }
    
}

extension PlayersCardsViewController: AddCardDelegate {
    func add(card: Card) {
        deck.cards.append(card)
        DispatchQueue.main.async {  //To update the UI you need to be in the main thread/queue.   This function sends us there.
            self.collectionView.reloadData()
        }
    }
}
