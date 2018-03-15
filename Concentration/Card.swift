//
//  Card.swift
//  Concentration
//  struct not a class
//  a part of the model
//  structs and classes are almost the same
//  no inheritances in structs, structs are value types
//  pass it around, gets constantly copied, copy on write semantics
//  Created by Caroline Berger on 14/03/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false //starts facedown
    var isMatched = false
    var identifier: Int
    
    //UI independent, never have emoji in model
   
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    //since this is a struct, and not a class, we must have an init no init is inherited
    init(){
        self.identifier = Card.getUniqueIdentifier() //this in java is like self
        
        
    }
}
