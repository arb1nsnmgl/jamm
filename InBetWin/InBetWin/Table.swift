//
//  Table.swift
//  InBetWin
//
//  Created by Jhantelle Belleza on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabaseUI

struct Table {
    
    var player: String = "" //UID?
    var playerPot: Int = 0
    var players: [[String:Any]] = []
    var round: Int = 0
    var key: String? = ""
    var ref = FIRDatabaseReference()
    let user = FIRAuth.auth()?.currentUser?.uid
    let tableName: String = ""
//    var dealer = Dealer(card: "", pot: 0)
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: Any]
        let dealerObject = snapshotValue["dealer"] as! [String: Any]
//        dealer.card = dealerObject["card"] as! String //Dealer from firebase
//        dealer.pot = dealerObject["pot"] as! Int
        players = snapshotValue["players"] as! [[String: Any]]
        for player in players {
            let userID = player["userid"] as! String
            guard let loggedIn = user else { return }
            if userID == user {
                playerPot = player["pot"] as! Int
            }
        }
        round = snapshotValue["dealer"] as! Int
        ref = snapshot.ref
    }
    
    //JCB
    func toAnyObject(player: Player) -> Any {
        
        let player = ["bet": player.bet,
                      "pot": player.pot,
                      "firstCard": player.firstCard,
                      "secondCard": player.secondCard,
                      "turn": player.turn] as [String : Any]
        
//        let dealer = ["pot": self.dealer.pot,
//                      "card": self.dealer.card] as [String : Any]
        
        return [
            "tableName": tableName, //UId
//            "dealer": dealer,
            "players": player,
            "round": round,
            "pot": playerPot,
            
        ]
    }
    
    
    
}
