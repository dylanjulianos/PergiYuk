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
        repository.getUser(email: email).sink { status in
            switch status {
            case .finished:
                print("Get User Data By Email (Data Store): Finish")
            case .failure(let error):
                print("Data Store Error:")
                print(error)
                self.user.send(completion: .failure(error))
                return
            }
        } receiveValue: { user in
            self.user.send(user)
        }
    }
    
    
    func addNew(newUser: User){
        repository.addUser(user: newUser).sink { status in
            switch status{
            case .finished:
                print("Successfully added user")
            case .failure(let error):
                self.user.send(completion: .failure(error))
            }
        } receiveValue: { newUser in
            self.user.send(newUser)
        }
    
    }

}
