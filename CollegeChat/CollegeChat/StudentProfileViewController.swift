//
//  ProfileViewController.swift
//  CollegeChat
//
//  Created by Mahmuda Akter on 4/29/21.
//

import UIKit
import AlamofireImage
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var datePicker: UIDatePicker?
    
    @IBOutlet weak var studentPP: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var dobTextField: UITextField!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var changePassward: UILabel!
    @IBOutlet weak var changePasswardTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(SignUpViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        datePicker?.preferredDatePickerStyle = .wheels
        dobTextField.inputView = datePicker
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        AddClassViewController().logout()
    }
    
    @IBAction func tapOnImage(_ sender: UITapGestureRecognizer) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            
        }else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as? UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image?.af_imageScaled(to: size)
        studentPP.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dobTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func onSaved(_ sender: Any) {
        
        let user = PFUser.current()
        let imageData = (studentPP.image?.pngData())!
        
        let file = PFFileObject(name: "studentImage.png", data: imageData)
        user!["profilePic"] = file
        
        user!["lastname"] = lastNameTextField.text!
        user!["firstname"] = firstNameTextField.text!
        user!["username"] = userNameTextField.text!
        user!["DOB"] = dobTextField.text!
        user!["password"] = changePasswardTextField.text!
        
        user?.saveInBackground{ (success, error) in
            if success {
                let addclasscontroller = AddClassViewController()
                addclasscontroller.logout()
            } else {
                print("Error")
            }
        }
        
    }
    
    @IBAction func onDeleted(_ sender: Any) {
      
        PFUser.current()?.deleteInBackground { (success, error) in
            
            if success {
                let addclasscontroller = AddClassViewController()
                addclasscontroller.logout()
                
            }else{
                print("Error!")
            }
            
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

}
