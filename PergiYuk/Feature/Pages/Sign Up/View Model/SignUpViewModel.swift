//
//  SignUpViewController.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 11/10/22.
//

import Foundation
import SwiftUI


class SignUpViewModel: ObservableObject {
    let userRepo = UserRepository.shared
    
    func checkSignUp(email: String, name: String, phoneNum: String, password: String, conf: String) -> Bool{
        if password != conf {
            print("please match your password")
            return false
        }
        let result = userRepo.getUser(text: email)
        if result == nil{
            print("Such email already exist.")
            return false
        } else {
            // Add user
            
            
//            coreData.fetchAllUser()
            return true
        }
    }
}

