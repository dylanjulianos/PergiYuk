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
    let userRepo = UserDataStore(repository: UserRepositoryDummyData())
    
    func createNewParty(image: String, title: String, destination: String, startDate: String, endDate: String, budget: Int){
        
        
    }
    
    func forgotPass(){
        print("To be implemented")
    }
}
