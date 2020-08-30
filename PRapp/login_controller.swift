//
//  login_controller.swift
//  PRapp
//
//  Created by Nathaniel Leonard on 7/7/20.
//  Copyright © 2020 PR. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class login_controller: UIViewController {
    
    @IBOutlet weak var email_login: UITextField!
    @IBOutlet weak var pass_login: UITextField!
    
    @IBOutlet weak var signin_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        
        
        // Style the elements
        Utilities.styleTextField(email_login)
        Utilities.styleTextField(pass_login)
        Utilities.styleFilledButton(signin_button)
        
    }
    
    @IBAction func signin_tappd(_ sender: Any) {
        
        // Create cleaned versions of the text field
        let email = email_login.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = pass_login.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                print("Incorrect login! Cannot sign-in")
            }
            else {
                self.transitionToHome()
            }
        }

}
    func transitionToHome() {
        let user = Auth.auth().currentUser
        let homeview_controller = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeview_controller) as? homeview_controller
        if Auth.auth().currentUser != nil{
            view.window?.rootViewController = homeview_controller
            view.window?.makeKeyAndVisible()
        } else
        {
            print("Not logged in")
        }
        
    }
    
    
}

