//
//  File Name. : ProfileViewController.swift
//  Assignment : InClass02c
//  Student Full Name : Pranalee Jadhav
//  Created by Pranalee Jadhav on 10/24/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLb: UILabel!
     @IBOutlet weak var emailLb: UILabel!
     @IBOutlet weak var pwdLb: UILabel!
     @IBOutlet weak var deptLb: UILabel!
    var user: User!
    @IBOutlet weak var toggleBtn: UIButton!
    var selected: String!
    var selected_val:String!
    var type:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        type = 0
        nameLb.text = user.name
        emailLb.text = user.email
        pwdLb.text = String(repeating: "*", count: user.password.count)
        deptLb.text = user.dept
    }

    @IBAction func togglePwd(_ sender: UIButton) {
        if sender.titleLabel?.text == "Show" {
            pwdLb.text = user.password
            toggleBtn .setTitle("Hide", for: UIControlState.normal)
        } else {
            toggleBtn .setTitle("Show", for: UIControlState.normal)
            pwdLb.text = String(repeating: "*", count: user.password.count)
        }
    }
    
    @IBAction func editName(_ sender: Any) {
        selected = "Name"
        selected_val = user.name
        type = 0
        performSegue(withIdentifier: "showeditview", sender: self)
    }
    
    @IBAction func editEmail(_ sender: Any) {
        selected = "Email"
        selected_val = user.email
        type = 1
        performSegue(withIdentifier: "showeditview", sender: self)
    }

    @IBAction func editPwd(_ sender: Any) {
        selected = "Password"
        selected_val = user.password
        type = 2
        performSegue(withIdentifier: "showeditview", sender: self)
    }
    
    
    @IBAction func editDept(_ sender: Any) {
        selected = "Department"
        type = 3
        selected_val = String(user.dept_index)
        performSegue(withIdentifier: "showeditview", sender: self)
    }
    
    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
        switch type {
        case 0:
            user.name = selected_val
            break
        case 1:
            user.email = selected_val
            break
        case 2:
            user.password = selected_val
            break
        case 3:
            var temp = Int(selected_val)
            user.dept =  temp == 0 ? "CS" : temp == 1 ? "SIS" : "BIO"
            user.dept_index = temp
            break
        default:
            break
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EditViewController
        vc.type = type
        vc.titlelb = selected
        vc.val = selected_val

    }
    
}
