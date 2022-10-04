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
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error as NSError?{
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
