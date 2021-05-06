//
//  AddClassViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 4/29/21.
//

import UIKit
import Parse

class AddClassViewController: UIViewController {

    @IBOutlet weak var invitationCode: UILabel!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    var classList = Set<String>()
    
    
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
    
    @IBAction func onClassAdded(_ sender: Any) {
        let user = PFUser.current()!
        let inviteCode = codeTextField.text!
        let query = PFQuery(className: "Chatroom")
        query.whereKey("inviteCode", equalTo: inviteCode)
       
        query.getFirstObjectInBackground {(chatroomObject: PFObject?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let chatroomObject = chatroomObject {
                let course = chatroomObject["chatName"] as! String
                print(course)
                self.classList.insert(course)
                user.addUniqueObjects(from: [course], forKey:"CourseList")
                user.saveInBackground()

                print(self.classList)
                self.performSegue(withIdentifier: "addsegue", sender: self)
            }
            
        }

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let classListTableCell = segue.destination as! StudentClassListViewController
        classListTableCell.course = classList
    }
    
}

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

