//
//  CreatePartyViewModel.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 31/10/22.
//

import Foundation
import SwiftUI

class CreatePartyViewModel: ObservableObject {
    var coreData = CoreDataManager.shared
    let userRepo = UserDataStore.shared
    let partyRepo = VacationPartyRepository.shared
    
    func createNewParty(image: String, title: String, destination: String, startDate: String, endDate: String, budget: Int){
        
        let user = userRepo.user
        if ((user?.vacationParty) != nil){
            print("Create new party")
            partyRepo.createParty(image: image, title: title, destination: destination, startDate: startDate, endDate: endDate, budget: budget)
        } else {
            print("this user already have a party")
        }
        
        print("Successfully created new party of the user")
        print(userRepo.user?.vacationParty ?? "No party")
    }
    
    func forgotPass(){
        print("To be implemented")
    }
}
