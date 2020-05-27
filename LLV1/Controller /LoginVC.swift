//
//  LoginVC.swift
//  LLV1
//
//  Created by Macklin Thomas on 4/16/20.
//  Copyright © 2020 Macklin Thomas. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        


    }
    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        
    }
    
    @IBAction func LoginClicked(_ sender: Any) {
        
        guard let emailPhone = emailTxt.text, emailPhone.isNotEmpty,
                let password = passwordTxt.text, password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: emailPhone, password: password) { authResult, error in
            if let error = error {
                self.activityIndicator.stopAnimating()
                debugPrint(error)
                return
            }
            
            self.activityIndicator.stopAnimating()
            print("Login was Successful!")
            
            let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabController") as! mainTabController
            self.present(mainTabController, animated: true, completion: nil)
        }
    }
    
   
}
