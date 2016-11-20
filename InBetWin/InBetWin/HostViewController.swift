//
//  HostViewController.swift
//  InBetWin
//
//  Created by Alexey Medvedev on 11/20/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import UIKit
import Firebase

class HostViewController: UIViewController {

    let ref = FIRDatabase.database().reference(withPath: "table")
    var table: Table!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table = Table()
    }

    @IBAction func joinGame(_ sender: Any) {
        
    }
    
    @IBAction func hostGame(_ sender: Any) {
        let tableItemRef = self.ref.child("table1")
        table.tableName = "table1"
        // create table
        tableItemRef.setValue(table.toAnyObject())
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "createGame" {
//            let destination = segue.destination as! MainViewController
//        }
//    }

}
