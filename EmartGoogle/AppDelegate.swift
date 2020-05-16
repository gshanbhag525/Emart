//
//  AppDelegate.swift
//  EmartGoogle
//
//  Created by Gunesh Shanbhag on 5/15/20.
//  Copyright © 2020 guneshs. All rights reserved.
//
import GoogleSignIn
import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    let defaults = UserDefaults.standard
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
         
        GIDSignIn.sharedInstance()?.clientID = "333533065053-cf589bkjpujvjvd4t851pm2tthjula1e.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        
        return true
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error == nil) {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC")
                       self.window = UIWindow(frame: UIScreen.main.bounds)
                       self.window?.rootViewController = initialViewController
                       self.window?.makeKeyAndVisible()
            
            // Perform any operations on signed in user here.
//             let userId = user.userID                  // For client-side use only!
//             let idToken = user.authentication.idToken // Safe to send to the server
//             let fullName = user.profile.name
//             let givenName = user.profile.givenName
//             let familyName = user.profile.familyName
//             let email = user.profile.email
//
//
//             print("\n\(String(describing: userId)) \n\(String(describing: idToken)) \n\(String(describing: fullName)) \n \(String(describing: givenName)) \n \(String(describing: familyName)) \n \(String(describing: email))");
//
//            if (user.profile.hasImage) {
//                    let url = user.profile.imageURL(withDimension: 100)
//
//                    print("url....\(String(describing: url))")
//
//                    self.defaults.set(url, forKey: "user_photo")
//                }
//
//            DispatchQueue.main.async { () -> Void in
//
//               self.defaults.setValue(email, forKeyPath: "gemail")
//               self.defaults.setValue(fullName, forKeyPath: "gfullName")
//
//
//           }
//
            
            
          
            
            
//            print("User email : \(user.profile.email ?? "No email")")
            
//            self.defaults.synchronize()
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let initialViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//             //withIdentifier: "HomeVC")
//            self.window?.rootViewController = initialViewController
//            self.window?.makeKeyAndVisible()
//
            
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC")
                       self.window = UIWindow(frame: UIScreen.main.bounds)
                       self.window?.rootViewController = initialViewController
                       self.window?.makeKeyAndVisible()
            print("\(error.localizedDescription)")
        }
    }
    

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    // Added from firebase docs for working with ios 8 or older
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }
    

}

