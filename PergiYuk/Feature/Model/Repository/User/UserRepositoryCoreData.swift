//
//  SeederCoreDataStore.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 01/11/22.
//

import Foundation
import CoreData

struct UserRepositoryCoreData: UserRepository{

    let context = CoreDataManager.shared.container.viewContext

    
    func getUser(email: String) -> (User?,RepositoryState) {
        let request = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "email == %@", email)
        request.predicate = predicate
        request.fetchLimit = 1
        var user: User?
        
        do {
            let data = try context.fetch(request)
            if data.count == 1 {
                user = data[0]
            } else if data.count > 1 {
                return (nil,.error(message: "Email already exists"))
            } else {
                return (nil,.error(message: "No such data"))
            }
        } catch let error {
            return (nil,.error(message: "Error Core Data - \(error.localizedDescription)"))
        }
        return (user,.success)
    }
    
    func addUser(user: User) -> Future<User,Error> {
        return Future<User,Error> { promise in
            let newUser = User(context: context)
            newUser.name = user.name
            
            do{
                try context.save()
                promise(.success(user))
            }catch error{
                promise(.failure(error))
            }
            
        }
        
        
        
    }
    
    func removeUser(email: String) -> User? {
        <#code#>
    }
}
