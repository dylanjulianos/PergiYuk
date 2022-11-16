//
//  abc.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 27/10/22.
//

import Foundation
import Combine

class SignInViewModel: ObservableObject {
    enum SignInViewModelState{
        case idle
        case loading
        case error
        case dataLoaded
        case userLoggedIn
    }

    @Published var signInViewModelState: SignInViewModelState = .idle
    @Published var errorMessage: String = ""
    var fetchedUser: User?
    var cancelables: Set<AnyCancellable> = []
    var dataStore: UserDataStore
    
    // do we need this?
    init(dataStore: UserDataStore){
        // The subscribers doesnt need the return value
        self.dataStore = dataStore
        dataStore.user.sink { status in
            switch status{
            case .finished:
                self.signInViewModelState = .dataLoaded
            case .failure(let error):
                self.signInViewModelState = .error
                self.errorMessage = "Error: \(error.localizedDescription) - \(error)"
            }
        } receiveValue: { value in
            self.fetchedUser = value
        }
        .store(in: &cancelables)
    }

    func signIn(email: String, password: String) {
        signInViewModelState = .loading
        
        if email == "" {
            errorMessage = "Insert your email"
            signInViewModelState = .error
            return
        }
        
        dataStore.getUserDataBy(email: email)
        
        if fetchedUser == nil {
            return
        }
        
        if password == fetchedUser?.password{
            signInViewModelState = .userLoggedIn
        } else {
            errorMessage = "Wrong password, try again"
            signInViewModelState = .error
            
            return
        }
        print("Signin")
    }
    
    func forgotPass(){
        print("To be implemented")
    }
}
