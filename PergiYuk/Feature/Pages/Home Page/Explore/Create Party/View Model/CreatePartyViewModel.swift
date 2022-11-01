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
    
    func createNewParty(image: String, title: String, destination: String, startDate: String, endDate: String, budget: Int){
        print("Create new party")
        
        
        
        print("Successfully created new party of the user")
//        print(coreData.user.vacationParty ?? "No party")
    }
    
    func forgotPass(){
        print("To be implemented")
    }
}
