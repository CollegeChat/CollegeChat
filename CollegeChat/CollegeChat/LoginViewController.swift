//
//  LoginViewController.swift
//  CollegeChat
//
//  Created by Abdurrahman on 4/22/21.
//

import UIKit
import Parse

class LoginViewController: ViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        self.performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                let accountType = (user?["accountType"])! as! String
                if accountType == "Student" || accountType == "Instructor" {
                    self.performSegue(withIdentifier: "StudentSegue", sender: nil)
                } else if accountType == "App Admin" {
                    self.performSegue(withIdentifier: "AppAdminSegue", sender: nil)
                } else if accountType == "College Admin" {
                    self.performSegue(withIdentifier: "CollegeAdminSegue", sender: nil)
                }
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
        
    }
    
}
