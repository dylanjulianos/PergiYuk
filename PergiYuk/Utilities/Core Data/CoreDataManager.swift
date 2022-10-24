//
//  CoreDataManager.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 30/09/22.
//

import CoreData
import Foundation

class CoreDataController: ObservableObject {
    let container = NSPersistentContainer(name: "PergiYukDataModel")
    @Published var usersData: [User] = []
    @Published var vacationPartiesData: [VacationParty] = []
    @Published var partyGroupChatsData: [GroupChatParty] = []
    @Published var user: User = User()
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            } else {
                print("Core Data successfully loaded.")
            }
        }
    }
    
    func deleteUser(entity: User) {
        container.viewContext.delete(entity)
        saveData()
    }
    
    func deleteVacationParty(entity: VacationParty) {
        container.viewContext.delete(entity)
        if let groupChat = entity.groupChat {
            deleteGroupChat(entity: groupChat)
        }
        saveData()
    }
    
    func deleteGroupChat(entity: GroupChatParty) {
        container.viewContext.delete(entity)
        saveData()
    }
    
    func fetchAllVacationParty(){
        let request = NSFetchRequest<VacationParty>(entityName: "VacationParty")
        
        do {
            try vacationPartiesData = self.container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching student data. \(error.localizedDescription)")
        }
        print("Vacation Parties retrieved: \(vacationPartiesData)")
    }

    func fetchAllGroupChat(){
        let request = NSFetchRequest<GroupChatParty>(entityName: "GroupChatParty")
        
        do {
            try partyGroupChatsData = self.container.viewContext.fetch(request)
            
        } catch let error {
            print("Error fetching student data. \(error.localizedDescription)")
        }
        print(partyGroupChatsData)
    }
    
    func fetchAllUser(){
        let request = NSFetchRequest<User>(entityName: "User")

        do {
            try usersData = self.container.viewContext.fetch(request)
            
        } catch let error {
            print("Error fetching student data. \(error.localizedDescription)")
        }
        for val in usersData{
            print("\(val.email ?? "")")
        }
    }
    
    func fetchOneUserByEmail(text: String) -> Bool{
        let request = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "email == %@", text)
        request.predicate = predicate
        request.fetchLimit = 1
        
        do {
            let data = try self.container.viewContext.fetch(request)
            print(data.count)
            if data.count == 1 {
                user = data[0]
                return true
            } else if data.count > 1 {
                print("Email already exists, use another one")
                return false
            } else {
                print("No such data")
                return false
            }
        } catch let error {
            print("Error fetching user data. \(error.localizedDescription)")
            return false
        }
    }
    
    func deleteAll(){
        fetchAllUser()
        for val in usersData{
            print(val)
            self.container.viewContext.delete(val)
        }
        saveData()
    }
    
    func saveData(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("Failed to save data \(error)")
        }
    }
}
