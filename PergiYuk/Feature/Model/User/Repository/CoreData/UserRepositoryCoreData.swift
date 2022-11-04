//
//  SeederCoreDataStore.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 01/11/22.
//

import Foundation
import CoreData
import Combine

struct UserRepositoryCoreData: UserRepository{

    let context = CoreDataManager.shared.container.viewContext

    func getUser(email: String) -> Future<User,Error> {
        return Future<User,Error>{ promise in
            let request = NSFetchRequest<CDUser>(entityName: "User")
            let predicate = NSPredicate(format: "email == %@", email)
            request.predicate = predicate
            request.fetchLimit = 1
            
            do {
                let cdUser = (try context.fetch(request)).first
                let user = cdUser.map{ User(email: $0.email ?? "Need to change the xcdatamaodel email type to non optional", name: "", password: "", phoneNumber: "") }
                if let user {
                    promise(.success(user))
                } else{
                    promise(.failure(UserRepositoryError.UserNotFound))
                }
            } catch let error {
                promise(.failure(error))
                
            }
            
        }
    }
    
    func addUser(user: User) -> Future<User,Error> {
        return Future<User,Error> { promise in
            let newUser = CDUser(context: context)
            newUser.name = user.name
            
            do{
                try context.save()
                promise(.success(user))
            }catch let error{
                promise(.failure(error))
            }
            
        }
    }
    
    func removeUser(email: String) -> Future<User, Error> {
        return Future<User,Error> { promise in
            
        }
    }

}
