//
//  FirebaseDatabase.swift
//  InBetWin
//
//  Created by Jhantelle Belleza on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct FirebaseDatabase {
    
    var ref = FIRDatabase.database().reference()
    var players: [Player]
    var tables: [Table]
    
    func createPlayers() {
        for player in players {
            let playerItemRef = self.ref.child("player")
            playerItemRef.setValue(player.toAnyObject())
        }
    }
    
    func createTables() {
        for table in tables {
            let tableItemRef = self.ref.child("table")
            tableItemRef.setValue(table.toAnyObject())
        }
    }
    
    func getDataFromFirebase() {
        ref.observe(.value, with: { snapshot in print(snapshot.value!)})
    }
    
    
}
