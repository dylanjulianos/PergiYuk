//
//  DummyDataStore.swift
//  PergiYuk
//
//  Created by octavianus on 02/11/22.
//

import Foundation
import Combine

class UserRepositoryDummyData: UserRepository{
    var users: [User] = []
    
    init() {
        var dummyUser1 = User()
        dummyUser1.name = "Okta"
        
        var dummyUser2 = User()
        dummyUser2.name = "Jack"
        
        var dummyUser3 = User()
        dummyUser3.name = "Eko"
        
        users.append(contentsOf: [dummyUser1,dummyUser2,dummyUser3])
    }
    
    func getUser(email: String) -> Future<User,Error> {
        return Future<User,Error> { promise in
        
            guard let user = self.users.first(where: { eachUser in
                return eachUser.email == email
            }) else { promise(.failure(UserRepositoryError.UserAlreadyExists))  }
            
            promise(.success(user))
        }
    }
    
    func addUser(user: User) -> Future<User,Error> {
        return Future<User,Error> { promise in
            
            if self.users.contains(where: { $0.email == user.email }){
                promise(.failure(UserRepositoryError.UserAlreadyExists))
            }
            
            self.users.append(user)
            promise(.success(user))
        }
    }
    
    func removeUser(email: String) -> Future<User,Error> {
        return Future<User,Error> { promise in
            guard let userIndex = self.users.firstIndex( where: { eachUser in
                return eachUser.email == email
            }) else { promise(.failure(UserRepositoryError.UserNotFound)) }
            
            let removedUser = self.users.remove(at: userIndex)
            promise(.success(removedUser))
        }
    }
}

