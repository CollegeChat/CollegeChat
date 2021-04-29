//
//  AddClassViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 4/29/21.
//

import UIKit
import Parse

class AddClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    //Logout bar button
    @IBAction func onLogout(_ sender: Any) {
        
        self.logout()
    }
    
    //Logout function, it can be used in other class
    func logout() {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginController = main.instantiateViewController(withIdentifier: "LoginController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else {
            return
        }
        delegate.window?.rootViewController = LoginController
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
