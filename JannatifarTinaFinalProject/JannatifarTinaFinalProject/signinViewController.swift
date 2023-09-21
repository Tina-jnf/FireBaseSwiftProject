//
//  signinViewController.swift
//  JannatifarTinaFinal
//
//  Created by Tina Jannatifar on 11/24/22.
//

import Foundation
import UIKit
import Firebase
class signinViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            
        }
    @objc func handleSignIn() {
           guard let email = email.text else { return }
           guard let pass = password.text else { return }
           
          
           
           Auth.auth().signIn(withEmail: email, password: pass) { user, error in
               if error == nil && user != nil {
                   self.dismiss(animated: false, completion: nil)
                   print("user logged in")
               } else {
                   print("Error logging in: \(error!.localizedDescription)")
                   self.signin.isEnabled=false
               }
           }
       }
    @IBAction func signinDidTapped(_ sender: UIButton) {
      
        if(email!.text != nil && password!.text != nil){
            handleSignIn()
        }
        else{
            signin.isEnabled=false
        }
    }
    
    
}
//
