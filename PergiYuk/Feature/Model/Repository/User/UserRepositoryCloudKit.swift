//
//  UserRepositoryCloudKit.swift
//  PergiYuk
//
//  Created by octavianus on 03/11/22.
//

import Foundation


class UserRepositoryCloudKit: UserRepository{
    
    
    func addUser(user: User) -> Future<User, Error> {
        return Future<User,Error> { promise in
            
            let cloudKitManager  = .....
            
            cloudkit.fetch {
                
                promise(.failer)
                
                promise(.succes())
            }
            
            
        }
    }
    
    
}
