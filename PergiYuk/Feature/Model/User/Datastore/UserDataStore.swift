//
//  UserRepository.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 31/10/22.
//

import Foundation
import Combine

class UserDataStore{
    var repository: UserRepository
    var user = PassthroughSubject<User,Error>()
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func getUserDataBy(email: String){
        
    }
    
    
    func addNew(newUser: User){
        repository.addUser(user: newUser).sink { status in
            switch status{
            case .finished:
                self.user.send(completion: .finished)
            case .failure(let error):
                self.user.send(completion: .failure(error))
            }
        } receiveValue: { newUser in
            self.user.send(newUser)
        }
    
    }

}


    
