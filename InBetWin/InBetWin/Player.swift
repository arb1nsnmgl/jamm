//
//  Player.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation


class Player {
    
    var cardsInHand : [Card] = []
    var tokens : Double
    var isBetting = false
    
    init(cardsInHand: [Card], tokens: Double) {
        
        self.cardsInHand = cardsInHand
        self.tokens = tokens
        
    }
    
}

