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
        deck.newDeck({ success in print(success) })
        
    }
    
    @IBAction func draw(_ sender: Any) {
        
        
        
    }
    
    
    
    
    
    
}

