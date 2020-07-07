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
    @IBOutlet weak var loginOutBtn: UIBarButtonItem!
    

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

            let homeScreenVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenVC") as! UIViewController
            homeScreenVC.modalPresentationStyle = .fullScreen
            self.present(homeScreenVC, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func loginOutClicked(_ sender: Any) {
        
        if let _ = Auth.auth().currentUser{
                //We are logged in.
            do {
                try Auth.auth().signOut()
                let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                self.present(mainTabController, animated: true, completion: nil)
            } catch {
                debugPrint(error.localizedDescription)
            }
        } else {
            let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.present(mainTabController, animated: true, completion: nil)
        }
        
    }
    
    
    
   
}
