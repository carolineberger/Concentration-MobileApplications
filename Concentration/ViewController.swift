//
//  ViewController.swift
//  Concentration
//
//  Created by Caroline Berger on 28/02/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    // lazy doesn't initialize until someone tries to use it, cannot have a did set
    
    
    
    var flipCount = 0 {
        didSet { flipCountLabel.text = "Flips: \(flipCount)"}
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen card was not in cardButtons")
        }
    }
 
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for:card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.2731316412, blue: 0.1692835391, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.9898510575, blue: 1, alpha: 1)
            }
        }
    }
    var emojiChoices = ["🙈","😈", "❄️"]

    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card)-> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at:randomIndex)
            
            
        }
      
        return emoji[card.identifier] ?? "?"
    }
}

