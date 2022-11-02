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
        userRepo.getUser(text: email)
        
        if let _ = userRepo.user {
            print("Such email already exist.")
            return false
        } else {
            // Add user if password is correct
            if password != conf {
                print("please match your password")
                return false
            }
            
            userRepo.addUser(name: name, pswd: password, email: email, phoneNum: phoneNum)
            return true
        }
    }
}

