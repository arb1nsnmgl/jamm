//
//  GameDetails.swift
//  InBetWin
//
//  Created by Jhantelle Belleza on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import Firebase

struct GameMechanics {
    
    var table: Table!
    var player: Player!
    var user = FIRAuth.auth()?.currentUser?.uid
    
    mutating func joinGame() {
        //create player, assign 100 token
        self.player = Player(tokens: 100, cardsInHand: [])
        
    }
    
    func setupTable() {
        //Get all the players from Firebase <table>
        
    }
    
}
