//
//  SignUpViewController.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 11/10/22.
//

import Foundation
import SwiftUI


class SignUpViewModel: ObservableObject {
    @ObservedObject var coreData = CoreDataController()
    
    
    func checkSignUp(email: String, name: String, phoneNum: String, password: String, conf: String) -> Bool{
        if password != conf {
            print("please match your password")
            return false
        }
        let result = coreData.fetchOneUserByEmail(text: email)
        if result {
            print("Such email already exist.")
            return false
        } else {
            let newUser = User(context: coreData.container.viewContext)
            newUser.name = name
            newUser.password = password
            newUser.email = email
            newUser.phoneNumber = phoneNum
            coreData.saveData()
            coreData.fetchAllUser()
            return true
        }
    }
}

