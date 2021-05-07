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

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField?.delegate = self
        passwordTextField?.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        //perform segue to homescreen
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                let accountType = (user?["accountType"])! as! String
                if accountType == "Student" || accountType == "Instructor" {
                    self.performSegue(withIdentifier: "StudentSegue", sender: nil)
                } else if accountType == "App Admin" {
                    self.performSegue(withIdentifier: "AppAdminSegue", sender: nil)
                } else if accountType == "College Admin" {
                    self.performSegue(withIdentifier: "CollegeAdminSegue", sender: nil)
                }
            } else {
                // print("Error: \(error?.localizedDescription)")
                if let descrip = error?.localizedDescription {
                    self.displayErrorMessage(message: descrip)
                }
            }
            
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
        
    }
    
    
    // This function will show error message if user failed to login or logout
    func displayErrorMessage(message:String) {
         let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
         let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
         }
         alertView.addAction(OKAction)
         if let presenter = alertView.popoverPresentationController {
             presenter.sourceView = self.view
             presenter.sourceRect = self.view.bounds
         }
         self.present(alertView, animated: true, completion:nil)
     }
}

