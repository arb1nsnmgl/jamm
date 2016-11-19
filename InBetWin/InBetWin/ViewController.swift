//
//  ViewController.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var store = CardAPIClient.shared
    var deck = Deck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //deck.newDeck({ success in print(success) })
        
        print("ACE".returnValue())
        print("6".returnValue())
    }

}

