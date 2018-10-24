//
//  File Name. : User.swift
//  Assignment : InClass02c
//  Student Full Name : Pranalee Jadhav
//  Created by Pranalee Jadhav on 10/24/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation

class User {
    var name:String!
    var email:String!
    var password:String!
    var dept:String!
    var dept_index:Int!
    
    init(nameStr: String, emailStr: String, pwdStr: String, deptStr: String, deptLoc: Int) {
        name = nameStr
        email = emailStr
        password = pwdStr
        dept = deptStr
        dept_index = deptLoc
        
    }
    
}
