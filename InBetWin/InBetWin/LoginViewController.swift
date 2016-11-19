//
//  LoginViewController.swift
//  InBetWin
//
//  Created by Alexey Medvedev on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI

class LoginViewController: UIViewController, FUIAuthDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        // initialize authUI class to provide view controller
        let authUI = FUIAuth.init(uiWith: FIRAuth.auth()!)
        
        // access clientID from GoogleService-Info.plist from defaults
        // let options = FIRApp.defaultApp()?.options
        // let clientID = options?.clientID
        
        // set this class as authUI delegate
        authUI?.delegate = self
        
        authUI?.providers = [FUIFacebookAuth(), FUIGoogleAuth()]
        
        let authViewController = authUI?.authViewController()
        self.present(authViewController!, animated: true)
    }
    
    // conforming to protocol
    public func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {}
}
