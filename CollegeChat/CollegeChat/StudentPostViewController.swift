//
//  StudentPostViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 4/29/21.
//

import UIKit
import Parse

class StudentPostViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    @IBOutlet weak var postTableView: UITableView!
    var course: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title? = course
        
        postTableView.delegate = self
        postTableView.dataSource = self
        //createPostNetwork()
        postTableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
//    func createPostNetwork() -> Void {
//
//        let post = PFObject(className: "Posts")
//        post["className"] = course!
//        post["author"] = PFUser.current()
////        post["title"] as! String
////        post["content"] as! String
////        post["postFile"] as! FILE
//
//
//        let comment = PFObject(className: "Comment")
//        comment["eachPost"] = post
//        comment["author"] = PFUser.current()
//
//        let invitecodeQuery = PFQuery(className: "Chatroom")
//        invitecodeQuery.whereKey("chatName", equalTo: course!)
//        invitecodeQuery.getFirstObjectInBackground {(chatroomObject: PFObject?, error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let chatroomObject = chatroomObject {
//                let inviteCode = chatroomObject["inviteCode"] as! String
//                post["classId"] = inviteCode
//            }
//        }
//        comment.saveInBackground()
//
//
//
//
//    }
//
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
