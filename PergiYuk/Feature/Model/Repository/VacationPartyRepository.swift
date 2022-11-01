//
//  VacationPartyRepository.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 01/11/22.
//

import Foundation

class VacationPartyRepository{
    let coreData = CoreDataManager.shared
    let context = CoreDataManager.shared.container.viewContext
    var coreDataStore: SeederCoreDataStore?
    var userRepo = UserRepository.shared
    
    static let shared = VacationPartyRepository()
    var vacationParties: [VacationParty]?
    
    func createParty(image: String, title: String, destination: String, startDate: String, endDate: String, budget: Int){
        
        let newParty = VacationParty(context: coreData.container.viewContext)
        
        newParty.name = title
        newParty.image = image
        newParty.destination = destination
        newParty.startDate = startDate
        newParty.endDate = endDate
        newParty.budget = Int32(budget)
        newParty.maximumUser = 4
        newParty.addToUsers(userRepo.user ?? User())
        // Butuh tanya soal nil value kalau optional gini
    }
}
