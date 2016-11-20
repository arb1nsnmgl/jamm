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
        
        updateButtonView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var signInButton: UIButton!
    
    
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
    public func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
    print(FIRAuth.auth()?.currentUser?.uid)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! MainTableViewController
        
    }
    
    func updateButtonView() {
        signInButton.layer.cornerRadius = 3.0
        
        signInButton.layer.masksToBounds = false
        signInButton.layer.shadowColor = UIColor.black.cgColor
        signInButton.layer.shadowRadius = CGFloat(10)
        
    }
}
