//
//  ClassListViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 4/29/21.
//

import UIKit
import Parse

class StudentClassListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var classListTableView: UITableView!
    
    var course = Set<String>()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        classListTableView.delegate = self
        classListTableView.dataSource = self
        
        classListTableView.reloadData()
    
        // Do any additional setup after loading the view.
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classListTableView.dequeueReusableCell(withIdentifier: "StudentClassTableViewCell") as! StudentClassTableViewCell
        
        let courseList = course.map {$0}
        
        cell.courseLabel.text = courseList[indexPath.row]

        return cell
        
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
