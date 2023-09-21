//
//  signoutViewController.swift
//  JannatifarTinaFinal
//
//  Created by Tina Jannatifar on 11/24/22.
//
import Foundation
import UIKit
import Firebase
class signupViewController: UIViewController{
   // var continueButton:signupButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
   
    func setSignupButton(enabled:Bool) {
        if enabled {
            self.signup.alpha = 1.0
            signup.isEnabled = true
        } else {
            signup.alpha = 0.5
            signup.isEnabled = false
        }
    }
    @objc func handleSignup(){
        //    guard let username = username.text else { return }
        guard let email = email.text else { return }
        guard let pass = pass.text else { return }
        setSignupButton(enabled: false)
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User created!")
            }
               
        }
     
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

           // Resigns the target textField and assigns the next textField in the form.
          switch textField {
          case user:
              user.resignFirstResponder()
              email.becomeFirstResponder()
              break
          case email:
              email.resignFirstResponder()
              pass.becomeFirstResponder()
              break
          case pass:
              handleSignup()
              break
          default:
              break
          }
          return true
      }
    @IBAction func signupDidTapped(_ sender: UIButton) {
        if(user.text != nil && email.text != nil && pass.text != nil){
            handleSignup()

        }
        else{
            signup.isEnabled=false
        }
    }
    
}
