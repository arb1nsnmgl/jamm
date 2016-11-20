//
//  Player.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation


class Player {
    
<<<<<<< HEAD
=======
    var cardsInHand : [Card] = []
    var tokens : Double
    var isBetting = false
    //JCB
    var playerName: String!
    
    init(playerName: String, cardsInHand: [Card], tokens: Double) {
        
        self.cardsInHand = cardsInHand
        self.tokens = tokens
        
    }
    
    //JCB
    func toAnyObject() -> Any {
        return [
            "name": playerName,
            "cardsInHand": cardsInHand,
            "tokens": tokens
        ]
    }

>>>>>>> master
}

