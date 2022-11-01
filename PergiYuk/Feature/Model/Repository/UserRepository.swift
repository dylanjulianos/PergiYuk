//
//  UserRepository.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 31/10/22.
//

import Foundation
import CoreData

class UserRepository{
    let coreData = CoreDataManager.shared
    let context = CoreDataManager.shared.container.viewContext
    var coreDataStore: SeederCoreDataStore?
    
    static let shared = UserRepository()
    
    var users: [User]?
    @Published var user: User?
    
    func getUsers() -> [User] {
        users = coreDataStore?.fetchAllUser()
        return users ?? [User()]
    }
    
    func getUser(text: String) -> User {
        user = coreDataStore?.fetchOneUserByEmail(text: text)
        return user ?? User()
    }
    
    func addUser(name: String, pswd: String, email: String, phoneNum: String) {
        let newUser = User(context: CoreDataManager.shared.container.viewContext)
        newUser.name = name
        newUser.password = pswd
        newUser.email = email
        newUser.phoneNumber = phoneNum
        
        coreData.saveData()
    }
    
    func deleteUser(entity: User) {
        context.delete(entity)
        coreData.saveData()
    }

    func deleteVacationParty(entity: VacationParty) {
        context.delete(entity)
        if let groupChat = entity.groupChat {
            deleteGroupChat(entity: groupChat)
        }
        coreData.saveData()
    }

    func deleteGroupChat(entity: GroupChatParty) {
        context.delete(entity)
        coreData.saveData()
    }

}
