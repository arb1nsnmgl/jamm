//
//  FirebaseDatabase.swift
//  InBetWin
//
//  Created by Jhantelle Belleza on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

struct FirebaseDatabase {
    
    var playerRef = FIRDatabase.database().reference().child("player")
    var tableRef = FIRDatabase.database().reference().child("table")
    var players: [Player]
    var tables: [Table]
    var user = FIRAuth.auth()?.currentUser?.uid
    

//    func createTables() {
//        for table in tables {
//            let tableItemRef = self.ref.child("table")
////            tableItemRef.setValue(table.toAnyObject())
//        }
//    }
    
//    func getDataFromFirebase() {
//        ref.observe(.value, with: { snapshot in print(snapshot.value!)})
//    }
    
    func gameSetup() {
        //Create players
        //
        
    }
    
    func getCurrentUser() {
        let currentID = FIRAuth.auth()?.currentUser?.uid
        
    }
    
    
    //ADD
    func addPlayerToFBase(player: Player) {
        let playerItemRef = playerRef.childByAutoId()
        playerItemRef.setValue(player.toAnyObject())
    }
    
    func updateTableDuringPlay(table: Table, player: Player) {
        //update turn, 1st and 2nd card,
        let tableItemRef = tableRef.child(table.tableName) //will change to table user ID? HOOOOOW!?
        let tabPlayersRef = tableItemRef.child("players")
        guard let currentUser = user else { return }
        let playerRef = tabPlayersRef.child(currentUser)
        let turn = playerRef.child("turn")
        turn.setValue(player.turn)
        let firstCard = playerRef.child("firstCard")
        let secondCard = playerRef.child("secondCard")
        firstCard.setValue(player.firstCard)
        secondCard.setValue(player.secondCard)
    }
    
    func updatePlayerDuringPlay(player: Player) {
        //update
        let playerItemRef = playerRef.child("USERID!!!!? IDUNNO HOW TO GET")
//        let 
//        playerItemRef.setValue(<#T##value: Any?##Any?#>)
//        
    }
    
    
    //GET
    func getTableDetails(table: Table) {
        let tableChild = tableRef.observe(.value, with: { snapshot in
            let value = snapshot.value as! [String: Any]
            
            
        })
    
    }
    
    
    
    

    
}
