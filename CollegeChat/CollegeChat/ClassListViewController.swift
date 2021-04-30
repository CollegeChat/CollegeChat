//
//  ClassListViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 4/29/21.
//

import UIKit
import Parse

class ClassListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var classListTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        classListTableView.delegate = self
        classListTableView.dataSource = self
        
        
        
        classListTableView.reloadData()
        
        

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func backToAdd(_ sender: UIBarButtonItem) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let addClassScreen = main.instantiateViewController(withIdentifier: "StudnetController")
        self.present(addClassScreen, animated: true, completion: nil)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classListTableView.dequeueReusableCell(withIdentifier: "ClassTableViewCell") as! ClassTableViewCell
        cell.courseLabel?.text = "row: \(indexPath.row)"
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
