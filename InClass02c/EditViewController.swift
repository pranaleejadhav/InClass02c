//
//  File Name. : EditViewController.swift
//  Assignment : InClass02c
//  Student Full Name : Pranalee Jadhav
//  Created by Pranalee Jadhav on 10/24/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var editFieldName: UILabel!
    @IBOutlet weak var fieldVal: UITextField!
    @IBOutlet weak var deptField: UISegmentedControl!
    var type: Int!
    var titlelb: String!
    var val:String!
    var proceed = true
    
    @IBOutlet weak var valHt: NSLayoutConstraint!
    @IBOutlet weak var deptHt: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editFieldName.text = titlelb
        print("type = \(type)")
        if type != 3{
            fieldVal.text = val
            deptField.isHidden = true
            fieldVal.isHidden = false
            deptHt.constant = 0
            valHt.constant = 40
        } else {
            deptField.selectedSegmentIndex = Int(val)!
            deptField.isHidden = false
            fieldVal.isHidden = true
            deptHt.constant = 40
            valHt.constant = 0
        }
    }
    
    

    func isAlpha(name: String) ->Bool {
        let nameRegex = "[a-zA-Z\\s]+"
        let valid = NSPredicate(format: "SELF MATCHES %@", nameRegex).evaluate(with: name)
        return valid
    }
    
    func isValidEmail(email: String) -> Bool {
        let stricterFilter = false;
        let stricterFilterString = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
        let laxString = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
        let emailRegex = stricterFilter ? stricterFilterString : laxString;
        
        let valid = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        return valid
    }
    
    func showMsg(title: String, subTitle: String) -> Void {
         self.proceed = false
            let alertController = UIAlertController(title: title, message:
                subTitle, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
       
    }
    
    @IBAction func update(_ sender: Any) {
        let fieldName = (editFieldName.text?.trimmingCharacters(in: .whitespaces))!
        let fieldVal = (self.fieldVal.text?.trimmingCharacters(in: .whitespaces))!
        val = fieldVal
        proceed = true
        
        switch type {
        case 0:
            if fieldVal == "" {
                showMsg(title: "", subTitle: "Name cannot be empty")
            } else if !isAlpha(name: fieldVal){
                showMsg(title: "", subTitle: "Name can contain only letters and spaces.")
            }
            break

        case 1:
            if fieldVal == "" {
                showMsg(title: "", subTitle: "Email cannot be empty")
            } else if !isValidEmail(email: fieldVal){
                showMsg(title: "", subTitle: "Invalid Email")
            }
            break
        case 2:
            if fieldVal == "" {
                showMsg(title: "", subTitle: "Password cannot be empty")
            } else if fieldVal.count<6{
                showMsg(title: "", subTitle: "Minimum length of password should be 5")
            }
            break
        case 3:
            val = String(deptField.selectedSegmentIndex)
            break
        default:
            break
        }
        
        if proceed == true {
            performSegue(withIdentifier: "updateprofile", sender: self)
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as! ProfileViewController
       vc.selected_val = val
       vc.type = type
        
    }

    
    
}
