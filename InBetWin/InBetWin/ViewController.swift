//
//  ViewController.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var gameTable = GameTableLogic()
    var deck = Deck()
    var store = CardAPIClient.shared
    
    
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playercard1: UIImageView!
    @IBOutlet weak var dealerCard: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameTable.drawDeck()
        
    }
    
    @IBAction func draw(_ sender: Any) {
        
        gameTable.drawCardForTheDealer()
        
    }
    
    
   
    @IBAction func drawPlayers(_ sender: Any) {
        
        gameTable.drawCardsForThePlayers()
        
    }
    
    
    @IBAction func addPlayer(_ sender: Any) {
        
        gameTable.addPlayer()
        print(gameTable.players.count)
    }
    
    
    
}

