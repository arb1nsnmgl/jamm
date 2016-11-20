//
//  MainTableViewController.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import UIKit
import Firebase

class MainTableViewController: UIViewController {
   
    var tableRef: FIRDatabaseReference?
    var table: Table? {
        didSet {
          title = table?.tableName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

   
}
