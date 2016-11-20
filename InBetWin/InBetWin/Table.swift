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
    var dealerPot: Int = 0
    var dealerCard: String = ""
    var pot: Int = 0
    var players: [[String:Any]] = []
    var round: Int = 0
    var key: String? = ""
    var ref = FIRDatabaseReference()
    let user = FIRAuth.auth()?.currentUser?.uid
    let tableName: String = ""
    
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: Any]
        let dealer = snapshotValue["dealer"] as! [String: Any]
        dealerCard = dealer["card"] as! String
        dealerPot = dealer["pot"] as! Int
        players = snapshotValue["players"] as! [[String: Any]]
        pot = snapshotValue["pot"] as! Int
        round = snapshotValue["dealer"] as! Int
        
        ref = snapshot.ref
    }
    
    //JCB
    func toAnyObject() -> Any {
        return [
            "tableName": tableName,
            "dealerCard": dealerCard,
            "players": players,
            "round": round,
            "pot": pot
        ]
    }
}
