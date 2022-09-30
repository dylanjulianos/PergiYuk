//
//  CoreDataManager.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 30/09/22.
//

import Foundation
import CoreData

class CoreDataManager{
    
    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    private init(){
        container = NSPersistentContainer(name: "PergiYukDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        context = container.viewContext
    }
}
