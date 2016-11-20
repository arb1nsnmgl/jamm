//
//  Dealer.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation

struct Dealer {
    var card: String
    var pot: Int
    
    init(card: String, pot: Int) {
        self.card = card
        self.pot = pot
    }
}
