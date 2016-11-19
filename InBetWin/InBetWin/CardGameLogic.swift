//
//  CardGameLogic.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation

extension String {
    
    func returnValue() -> Int {
        
        switch self {
        case "ACE": return 1
        case "KING" : return 13
        case "QUEEN" :  return 12
        case "JACK" : return 11
        default: return Int(self)!
        }
        
    }
    
}

class CardGameLogic {
    
    var deck = Deck()
    var player: Player!
    var dealer = Dealer()
    
    func drawCardforDealer() -> Int {
        
        var cardValue : Int!
        deck.drawCards(numberOfCards: 1, handler: { success, card in
            OperationQueue.main.addOperation {
                if let value = card?[0].value {
                    cardValue = value.returnValue()
                }
            }
        })
        return cardValue
    }
    
    func drawCardForPlayers() -> [Int] {
        var cardValue : [Int] = []
        deck.drawCards(numberOfCards: 2, handler: { success, cards in
            
            guard let drawnCards = cards else { fatalError() }
            for card in drawnCards {
                OperationQueue.main.addOperation {
                     cardValue.append(card.value.returnValue())
                }
            }
        })
        return cardValue
    }
    
//    func evaluateCard(_ player: )
    
    
}
