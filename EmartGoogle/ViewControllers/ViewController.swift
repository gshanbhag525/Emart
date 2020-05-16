//
//  ViewController.swift
//  EmartGoogle
//
//  Created by Gunesh Shanbhag on 5/15/20.
//  Copyright © 2020 guneshs. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            //signed in
//            transitionToHome()
        }
        else {
//            GIDSignIn.sharedInstance()?.signIn()
        }
        
        
        
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Silent login
        //        GIDSignIn.sharedInstance().signIn()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (GIDSignIn.sharedInstance()?.currentUser == nil) {
            
        } else {
            presentLoggedInAlert()
        }
    }
    
    func transitionToHome() {

        let homeViewController =
             storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController)
        as? HomeViewController

        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()

    }
    
    func presentLoggedInAlert() {
        let alertController = UIAlertController(title: "You're logged in", message: "Welcome to Vay.K", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

