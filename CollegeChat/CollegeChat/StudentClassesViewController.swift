//
//  StudentClassesViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 5/6/21.
//

import UIKit
import Parse

class StudentClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var classesTableView: UITableView!
    
    var courses: [String]!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let user = PFUser.current()!
        courses = user["CourseList"].map{$0} as? [String]
        print(user["CourseList"]!)
        classesTableView.reloadData()

        
        classesTableView.delegate = self
        classesTableView.dataSource = self
        classesTableView.reloadData()
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return courses.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classesTableView.dequeueReusableCell(withIdentifier: "StudentClasslistTableViewCell" ) as! StudentClasslistTableViewCell
        cell.classLabel.text = courses[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = classesTableView.indexPath(for: cell)!
        
        let courseId = courses[indexPath.row]
        
        let studentPostTable = segue.destination as! StudentPostViewController
        studentPostTable.course = courseId
        
        classesTableView.deselectRow(at: indexPath, animated: true)
        
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
