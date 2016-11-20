//
//  Player.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


class Player {
    
    var cardsInHand : [Card] = []
    var tokens : Double = 0.0
    var isBetting = false
    //JCB
    var playerName: String? = ""
    let user = FIRAuth.auth()?.currentUser?.uid
    var key: String? = ""
    var tableID: String? = ""
    var ref: FIRDatabaseReference?
    
    init(cardsInHand: [Card], tokens: Double) {
        self.cardsInHand = cardsInHand
        self.tokens = tokens
    }
    
    //JCB
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: Any]
        playerName = snapshotValue["name"] as? String
        tokens = (snapshotValue["token"] as? Double)!
        tableID = snapshotValue["tableID"] as? String
        cardsInHand.append(snapshotValue["firstCard"] as! Card)
        cardsInHand.append(snapshotValue["secondCard"] as! Card)
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": playerName,
            "cardsInHand": cardsInHand,
            "tokens": tokens,
            "cardsInHand": cardsInHand
        ]
    }
    
    func createPlayer() {
        //Get Player name from the User ID
    }

}

