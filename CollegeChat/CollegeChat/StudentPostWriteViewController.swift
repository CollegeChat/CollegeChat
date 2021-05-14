//
//  StudentPostWriteViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 5/6/21.
//

import UIKit
import Parse

class StudentPostWriteViewController: UIViewController {

    var className:String!
    
    @IBOutlet weak var postWriteTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onsubmit(_ sender: Any) {
        
        let post = PFObject(className: "Posts")
        post["className"] = className
        post["content"] = postWriteTextField.text!
        
        
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
