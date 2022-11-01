//
//  CoreDataManager.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 30/09/22.
//

import CoreData
import Foundation

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PergiYukDataModel")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            } else {
                print("Core Data successfully loaded.")
            }
        }
        return container
    }()
    
    func saveData(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("Failed to save data \(error)")
        }
    }
    
    
    
//    @Published var usersData: [User] = []
//    @Published var vacationPartiesData: [VacationParty] = []
//    @Published var partyGroupChatsData: [GroupChatParty] = []
//    @Published var user: User = User()

}
