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
    @Published var userData: [User] = []
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            } else {
                print("Core Data successfully loaded.")
            }
        }
    }
    
    func fetchUser(){
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            try userData = self.container.viewContext.fetch(request)
            
        } catch let error {
            print("Error fetching student data. \(error.localizedDescription)")
        }
        print(userData)
    }
}
