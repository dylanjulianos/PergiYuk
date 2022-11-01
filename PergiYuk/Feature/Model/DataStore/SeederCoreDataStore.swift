//
//  SeederCoreDataStore.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 01/11/22.
//

import Foundation
import CoreData

struct SeederCoreDataStore{
    let coreData = CoreDataManager.shared
    let context = CoreDataManager.shared.container.viewContext
    
//    @Published var vacationParties: [VacationParty] = []
//    @Published var partyGroupChatsData: [GroupChatParty] = []
    
    func fetchAllUser() -> [User]{
        let request = NSFetchRequest<User>(entityName: "User")

        do {
            let data = try context.fetch(request)
            return data
            
        } catch let error {
            print("Error fetching student data. \(error.localizedDescription)")
        }
        return [User()]
        
    }
    
    func fetchOneUserByEmail(text: String) -> User{
        let request = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "email == %@", text)
        request.predicate = predicate
        request.fetchLimit = 1
        var user: User?
        
        do {
            let data = try context.fetch(request)
            print("found \(data.count) result(s)")
            if data.count == 1 {
                user = data[0]
            } else if data.count > 1 {
                print("Email already exists, use another one")
            } else {
                print("No such data")
            }
        } catch let error {
            print("Error fetching user data. \(error.localizedDescription)")
        }
        return user ?? User()
    }
    
    func fetchAllVacationParty() -> [VacationParty]{
        let request = NSFetchRequest<VacationParty>(entityName: "VacationParty")
        var vacationParties: [VacationParty] = []
        
        do {
            try vacationParties = context.fetch(request)
        } catch let error {
            print("Error fetching student data. \(error.localizedDescription)")
        }
        print("Vacation Parties retrieved: \(vacationParties)")
        return vacationParties
    }

//    func fetchAllGroupChat(){
//        let request = NSFetchRequest<GroupChatParty>(entityName: "GroupChatParty")
//        var partyGroupChats: [GroupChatParty]
//        do {
//            try partyGroupChats = context.fetch(request)
//        } catch let error {
//            print("Error fetching student data. \(error.localizedDescription)")
//        }
//
//        print(partyGroupChats)
//    }
    
    // Use carefully!!
    func deleteAllUser(){
        let datas = fetchAllUser()

        for val in datas{
            print(val)
            context.delete(val)
        }
        coreData.saveData()
    }
}
