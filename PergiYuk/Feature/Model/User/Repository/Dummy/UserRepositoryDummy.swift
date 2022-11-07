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
        let dummyUser1 = User(email: "okat@gmailc", name: "", password: "", phoneNumber: "")
        
        let dummyUser2 = User(email: "jack@gmailc", name: "", password: "", phoneNumber: "")
        
        let dummyUser3 = User(email: "ken@gmailc", name: "", password: "", phoneNumber: "")
        
        users.append(contentsOf: [dummyUser1,dummyUser2,dummyUser3])
    }
    
    func getUser(email: String) -> Future<User,Error> {
        return Future<User,Error> { promise in
        
            guard let user = self.users.first(where: { eachUser in
                return eachUser.email == email
            }) else {
                promise(.failure(UserRepositoryError.UserAlreadyExists))
                return
            }
            
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
            }) else {
                promise(.failure(UserRepositoryError.UserNotFound))
                return
            }
            
            let removedUser = self.users.remove(at: userIndex)
            promise(.success(removedUser))
        }
    }
}

