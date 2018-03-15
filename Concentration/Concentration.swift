//
//  Concentration.swift
//  Concentration
//  public API, a part of the Model
//  reference types, passing pointers around
//  Created by Caroline Berger on 14/03/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import Foundation

class Concentration {
    var cards = Array<Card>() //exists, but no cards in it
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
        }
    }
    init(numberOfPairsOfCards: Int){
        // ... includes end of range, .. does not include end of range
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            
            // pass structs around, you are copying them, really three different cards
        }
        
        // TODO: Shuffle the cards
        
        // TODO: add new game
    }
}
