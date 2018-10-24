//
//  File Name. : HomeViewController.swift
//  Assignment : InClass02c
//  Student Full Name : Pranalee Jadhav
//  Created by Pranalee Jadhav on 10/24/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//


import UIKit
import IHKeyboardAvoiding

class HomeViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var deptField: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    var temp_user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KeyboardAvoiding.avoidingView = self.stackView
        var tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        scrollView.isUserInteractionEnabled = true
        scrollView.canCancelContentTouches = false
        scrollView.addGestureRecognizer(tap)
       
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        scrollView.resignFirstResponder()
    }

    @IBAction func submitForm(_ sender: Any) {
        let uname = (nameField.text?.trimmingCharacters(in: .whitespaces))!
        let email = (emailField.text?.trimmingCharacters(in: .whitespaces))!
        let pwd = (pwdField.text?.trimmingCharacters(in: .whitespaces))!
        let dept = deptField.titleForSegment(at: deptField.selectedSegmentIndex)
        
        if uname == "" {
            showMsg(title: "", subTitle: "Name cannot be empty")
        } else if !isAlpha(name: uname){
            showMsg(title: "", subTitle: "Name can contain only letters and spaces.")
        } else if email == "" {
            showMsg(title: "", subTitle: "Email cannot be empty")
        } else if !isValidEmail(email: email){
            showMsg(title: "", subTitle: "Invalid Email")
        } else if pwd == "" {
            showMsg(title: "", subTitle: "Password cannot be empty")
        } else if pwd.count<6{
            showMsg(title: "", subTitle: "Minimum length of password should be 5")
        } else {
            temp_user = User(nameStr: uname, emailStr: email, pwdStr: pwd, deptStr: dept!, deptLoc: deptField.selectedSegmentIndex)
            performSegue(withIdentifier: "gotoprofilepage", sender: self)
        }
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoprofilepage" {
            let vc = segue.destination as! ProfileViewController
            
            vc.user = temp_user
            
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
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title: title, message:
                subTitle, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        })
    }

}
