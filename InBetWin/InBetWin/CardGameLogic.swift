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
    var playerCardValue : [Int] = []
    var dealerCardValue : Int?
    
    func drawCardforDealer() {
        
        deck.drawCards(numberOfCards: 1, handler: { success, card in
            
            
            OperationQueue.main.addOperation {
                //card[0].downloadImage(<#T##handler: (Bool) -> Void##(Bool) -> Void#>)
                if let value = card?[0].value {
                    self.dealerCardValue = value.returnValue()
                }
            }
        })
        
    }
    
    func drawCardForPlayers() {
        
        deck.drawCards(numberOfCards: 2, handler: { success, cards in
            
            guard let drawnCards = cards else { fatalError() }
            for card in drawnCards {
                OperationQueue.main.addOperation {
                    //card.downloadImage(<#T##handler: (Bool) -> Void##(Bool) -> Void#>)
                    self.playerCardValue.append(card.value.returnValue())
                    self.playerCardValue.sort(by: <)
                }
            }
        })
        
    }
    
    func evaluateCard() {
        
        guard let playerFirstCard = playerCardValue.first else { return }
        guard let playerSecondCard = playerCardValue.last else { return }
        guard let dealerCard = dealerCardValue else { return }
        
        switch dealerCard {
        case playerFirstCard, playerSecondCard: print("you lose")
        case playerFirstCard...playerSecondCard: print("In between!")
        default: print("You lose")
            
        }
        
    }
}
