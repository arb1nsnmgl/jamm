//
//  Table.swift
//  InBetWin
//
//  Created by Jhantelle Belleza on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation

struct Table {
    
    var tableName: String
    var dealerCard: String
    var players: [Player]
    
    //JCB
    func toAnyObject() -> Any {
        return [
            "tableName": tableName,
            "dealerCard": dealerCard,
            "players": players
        ]
    }
}
