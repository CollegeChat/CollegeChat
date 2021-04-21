//
//  LoginViewController.swift
//  CollegeChat
//
//  Created by Anshul Jha on 4/20/21.
//

//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Anshul Jha on 3/12/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        //perform segue to homescreen
        /*PFUser.logInWithUsername(inBackground: email, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "exampleSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }*/
        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
}

