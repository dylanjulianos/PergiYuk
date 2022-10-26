//
//  SignInViewController.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 11/10/22.
//

import Foundation
import SwiftUI

class SignInViewModel: ObservableObject {
    @ObservedObject var coreData = CoreDataController()
    
    
    func checkSignIn(email: String, password: String) -> Bool{
        let result = coreData.fetchOneUserByEmail(text: email)
        
        if result && coreData.user.password == password{
            print("success login")
            // Do some logic
            
            return true
        } else {
            print("Unable to login, please make sure your email and password is correct")
            return false
        }
        
    }
}
