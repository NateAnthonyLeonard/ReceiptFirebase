//
//  signup_controller.swift
//  PRapp
//
//  Created by Nathaniel Leonard on 7/6/20.
//  Copyright © 2020 PR. All rights reserved.
//

import Foundation
import UIKit
import Firebase




class signup_controller: UIViewController {
    

    @IBOutlet weak var firstnametextfield: UITextField!
    
    @IBOutlet weak var lastnametextfield: UITextField!
    @IBOutlet weak var emailtextfield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!
    
    @IBOutlet weak var passtextfield: UITextField!
    
    @IBOutlet weak var signupbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func setUpElements() {
       
        
        // Style the elements
        Utilities.styleTextField(firstnametextfield)
        Utilities.styleTextField(lastnametextfield)
        Utilities.styleTextField(emailtextfield)
        Utilities.styleTextField(passtextfield)
        
    }
    func validateFields() -> String?
    {
        if firstnametextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastnametextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailtextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || phonetextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passtextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        // check if password is secure
        let cleanedPassword = passtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    @IBAction func signuptap(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            print("Error")
            
        }
        else{
        //create clean versions of the data
            let firstName = firstnametextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastnametextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phonenumber = phonetextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // User was created successfully, now store the first name and last name
                let db = Firestore.firestore()
                    
                db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "phone_number":phonenumber,  "uid": result!.user.uid ]) { (error) in
                }
        
        }
        self.transitionToHome()
    }
   
}
    func transitionToHome() {
        
        let homeview_controller = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeview_controller) as? homeview_controller
        
        view.window?.rootViewController = homeview_controller
        view.window?.makeKeyAndVisible()
        
    }
}

