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
    var posts = [PFObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title? = course
        
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.whereKey("ChatRoomName", equalTo: course!)
        query.findObjectsInBackground { (postObjects:[PFObject]?, error:Error?) in
            if let error = error{
                print(error.localizedDescription)
            } else if let postObjects = postObjects {
                print("Successfully retrieved \(postObjects.count) posts.")
                self.posts = postObjects
                print(postObjects)
                
            }
            self.postTableView.reloadData()

        
    }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "StudentPostTableViewCell") as! StudentPostTableViewCell
        print(indexPath.row)
        let singlePost = posts[indexPath.row]
        let user = singlePost["author"] as! PFUser
        print(user)
        //cell.authorNameLabel.text = user.username
        
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let postWriteView = segue.destination as! StudentPostWriteViewController
        postWriteView.className = course
        
        
        
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
