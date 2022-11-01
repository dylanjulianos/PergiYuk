//
//  abc.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 27/10/22.
//

import Foundation
import SwiftUI

class SignInViewModel: ObservableObject {
    let userRepo = UserRepository.shared
    
    
    func checkSignIn(email: String, password: String) -> Bool{
        let result = userRepo.getUser(text: email)
        
        if result.password == password{
            print("success login")
            // Do some logic
            
            return true
        } else {
            print("Unable to login, please make sure your email and password is correct")
            return false
        }
        
    }
    
    func forgotPass(){
        print("To be implemented")
    }
}
