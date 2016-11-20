//
//  User.swift
//  InBetWin
//
//  Created by Jhantelle Belleza on 11/20/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
}
