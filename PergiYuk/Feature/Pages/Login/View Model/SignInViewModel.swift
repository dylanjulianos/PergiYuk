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
        case userLoggedIn
    }

    @Published var signInViewModelState: SignInViewModelState = .idle
    @Published var errorMessage: String = ""
    var fetchedUser: User?
    var cancelables: Set<AnyCancellable> = [] //what is this for?
    var dataStore: UserDataStore = UserDataStore(repository: UserRepositoryDummyData())
    
    // do we need this?
    init(){
        // The subscribers doesnt need the return value
        dataStore.user.sink { status in
            switch status{
            case .finished:
                self.signInViewModelState = .userLoggedIn
            case .failure(let error):
                self.signInViewModelState = .error
                self.errorMessage = error.localizedDescription
            }
        } receiveValue: { value in
            self.fetchedUser = value
        }
        .store(in: &cancelables)
    }

    func signIn(email: String, password: String) {
        signInViewModelState = .loading
        
        dataStore.getUserDataBy(email: email)
        
        if password != fetchedUser?.password{
            errorMessage = "Wrong password, try again"
            signInViewModelState = .idle
        }
        print("Signin")
    }
    
    func forgotPass(){
        print("To be implemented")
    }
}
