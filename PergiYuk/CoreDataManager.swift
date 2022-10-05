//
//  CoreDataManager.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 30/09/22.
//

import CoreData
import Foundation

class CoreDataController: ObservableObject {
    let container: NSPersistentContainer
//    @Published var savedParty: [VacationParty] = []
    
    init() {
        container = NSPersistentContainer(name: "PergiYukDataModel")
        container.loadPersistentStores { (desc, error) in
            if let error = error as NSError?{
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveData(){
        do {
            try container.viewContext.save()
            
        } catch let error {
            print("Failed saving: \(error)")
        }
    }
}
