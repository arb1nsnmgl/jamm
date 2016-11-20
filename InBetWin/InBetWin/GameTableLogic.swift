//
//  GameTableLogic.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation


class GameTableLogic {
    
    var players : [Player] = []
    var deck = Deck()
    var isGameOnGoing = false
    
    func drawCardsForThePlayers() {
        
        if players.count >= 2 {
            
            for player in players {
                
                deck.drawCards(numberOfCards: 2, handler: { _ , cards in
                    guard let cards = cards else { return }
                    OperationQueue.main.addOperation {
                        player.cardsInHand = cards
                    }
                    
                })
                
            }
        }
        isGameOnGoing = true
    }
    
    
    
    
    
    
}
