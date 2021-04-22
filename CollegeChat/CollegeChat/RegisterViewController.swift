//
//  RegisterViewController.swift
//  CollegeChat
//
//  Created by Abdurrahman on 4/22/21.
//

import UIKit
import Parse

class RegisterViewController: ViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = usernameField.text
        user["accountType"] = "Student"
        user["firstname"] = firstnameField.text
        user["lastname"] = lastnameField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "RegisterCompletionSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        
    }
    
}
