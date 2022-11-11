//
//  SignUpViewController.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 11/10/22.
//

import Foundation
import Combine



class SignUpViewModel: ObservableObject {

    enum SignUpViewModelState{
        case idle
        case loading
        case error
        case userCreated
    }
    
    @Published var signUpViewModelState: SignUpViewModelState = .idle
    @Published var errorMessage: String = ""
    var cancelables: Set<AnyCancellable> = []
    
    var dataStore: UserDataStore = UserDataStore(repository: UserRepositoryDummyData())
    
    init(dataStore: UserDataStore){
        self.dataStore = dataStore
        // The subscribers doesnt need the return value
        dataStore.user.sink { status in
            switch status{
            case .finished:
                self.signUpViewModelState = .userCreated
            case .failure(let error):
                self.signUpViewModelState = .error
                self.errorMessage = error.localizedDescription
            }
        } receiveValue: { _ in }
        .store(in: &cancelables)
    }
    
    
    func signUp(email: String, name: String, phoneNum: String, password: String, conf: String){
        signUpViewModelState = .loading
        
        if email == "" || name == "" || phoneNum == "" || password == "" {
            self.errorMessage = "Please fill all of the fields above"
            signUpViewModelState = .idle
            return
        }
        if password != conf {
            self.errorMessage = "Please match the password confirmation"
            signUpViewModelState = .idle
            return
        }
        
        let newUser = User(email: email, name: name, password: password, phoneNumber: phoneNum)
        
        dataStore.addNew(newUser: newUser)
    }
}

