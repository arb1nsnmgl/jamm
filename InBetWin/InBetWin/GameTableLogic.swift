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
    var dealer : Card?
    var isGameOnHold = true
    var pot: Double = 0
    var whosTurnToBet = 0
    
    
    
    func drawDeck() {
        
        deck.newDeck({ success in print(success) })
        
    }
    
    func addPlayer() {
        let player = Player(tokens: 100, cardsInHand: [])
        players.append(player)
        print(player)
    }
    
    func drawCardsForThePlayers() {
        
        if players.count >= 2 && isGameOnHold {
            
            for player in players {
                deck.drawCards(numberOfCards: 2, handler: { _ , cards in
                    guard let cards = cards else { return }
                    OperationQueue.main.addOperation {
                        print(cards)
                        player.cardsInHand = cards
                        print(player.cardsInHand.count)
                        player.tokens -= 5
                        self.pot += 5
                    }
                })
            }
        }
        isGameOnHold = false
    }
    
    func playerTurnToBet(_ bet: Double) {
        
        if players[whosTurnToBet].tokens != 0 || players[whosTurnToBet].tokens >= pot {
            //evaluate card after hitting BET button.
            players[whosTurnToBet].tokens -= bet
            pot += bet
        }
        whosTurnToBet == (players.count - 1) ? (whosTurnToBet = 0) : (whosTurnToBet += 1)
        
    }
    
    func drawCardForTheDealer() {
        
        deck.drawCards(numberOfCards: 1, handler: { _, cards in
            
            guard let card = cards?[0] else { return }
            OperationQueue.main.addOperation {
                self.dealer = card
                print(self.dealer?.value)
            }
        
        })
        
    }
    
    func evaluateCardForEachTurn(with bet: Double, from player: Player, dealer card: Card, response: Bool?) {
        
        guard let playerFirstCard = player.cardsInHand.first?.value.returnValue() else { return }
        guard let playerSecondCard = player.cardsInHand.last?.value.returnValue() else { return }
        guard let dealer = dealer else { return }
        
        var greaterRank = playerFirstCard
        var lesserRank = playerSecondCard
        
        if lesserRank > greaterRank {
           greaterRank = playerSecondCard
           lesserRank = playerFirstCard
        }
        
        if playerFirstCard == playerSecondCard {
           
            // evaluate the player's decision
            playersDecision(response!, player: player, dealer: dealer, bet: bet)
            
        } else {
            
            
            switch card.value.returnValue() {
                
            case lesserRank, greaterRank:
                
                //update UI
                print("YOU LOSE!")
                
            case lesserRank...greaterRank:
                
                //Update UI
                player.tokens += (bet * 2)
                pot -= bet
                
            default:
                
                //Update UI
                print("YOU LOSE!")
            }
            
        }
        isGameOnHold = true
        
    }
    
    func playersDecision(_ response: Bool, player: Player, dealer card: Card, bet: Double) {
        
        // response will come from UI
        guard let playerCard = player.cardsInHand.first?.value.returnValue() else { return }
        
        if response {
            
            switch card.value.returnValue() {
            case (playerCard + 1)...13:
                player.tokens += (bet * 2)
                pot -= bet
            default:
                print("YOU LOSE")
            }
            
        } else {
            
            switch card.value.returnValue() {
            case 1..<playerCard:
                player.tokens += (bet * 2)
                pot -= bet
            default:
                print("YOU LOSE")
            }
        }
        
    }
    
    
}
