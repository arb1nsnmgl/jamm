//
//  AppController.swift
//  InBetWin
//
//  Created by Alexey Medvedev on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import UIKit
import Firebase

class AppController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    var actingViewController: UIViewController!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialViewController()
        addNotificationObservers()
        
    }
    
    // MARK: Set Up
    
    private func loadInitialViewController() {
        // Auth object listener
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if user != nil {
                // user is signed in
                self.actingViewController = self.loadViewController(withID: .hostVC)
            } else {
                // no user is signed in
                self.actingViewController = self.loadViewController(withID: .loginVC)
            }
            self.addActing(viewController: self.actingViewController)
        }
        
    }
    
    private func addNotificationObservers() {
        // close login view controller & switch to activities once user has obtained an authorizat ion token
        NotificationCenter.default.addObserver(self, selector: #selector(switchViewController(with:)), name: .closeLoginVC, object: nil)
    }
    
    // MARK: View Controller Handling
    
    private func loadViewController(withID id: StoryboardID) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch id {
        case .loginVC:
            return storyboard.instantiateViewController(withIdentifier: id.rawValue) as! LoginViewController
        case .mainVC:
            return storyboard.instantiateViewController(withIdentifier: id.rawValue) as! MainViewController
        case .hostVC:
            return storyboard.instantiateViewController(withIdentifier: id.rawValue) as! HostViewController
        default:
            fatalError("ERROR: Unable to find controller with storyboard id: \(id)")
        }
    }
    
    private func addActing(viewController: UIViewController) {
        
        self.addChildViewController(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
        
    }
    
    func switchViewController(with notification: Notification) {
        
        switch notification.name {
        case Notification.Name.closeLoginVC:
            switchToViewController(withID: .mainVC)
        default:
            fatalError("ERROR: Unable to match notification name")
        }
    }
    
    private func switchToViewController(withID id: StoryboardID) {
        
        let exitingViewController = actingViewController
        exitingViewController?.willMove(toParentViewController: nil)
        
        actingViewController = loadViewController(withID: id)
        self.addChildViewController(actingViewController)
        
        addActing(viewController: actingViewController)
        actingViewController.view.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.actingViewController.view.alpha = 1
            exitingViewController?.view.alpha = 0
            
        }) { completed in
            exitingViewController?.view.removeFromSuperview()
            exitingViewController?.removeFromParentViewController()
            self.actingViewController.didMove(toParentViewController: self)
        }
        
    }
    
}
