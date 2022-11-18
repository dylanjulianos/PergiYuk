//
//  CreatePartyViewModel.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 31/10/22.
//

import Foundation
import SwiftUI
import Combine

class CreatePartyViewModel: ObservableObject {
    
    enum CreatePartyViewModelState{
        case idle
        case loading
        case error
        case partyCreated
    }

    @Published var createPartyViewModelState: CreatePartyViewModelState = .idle
    @Published var errorMessage: String = ""
    var cancelables: Set<AnyCancellable> = []

    var dataStore: VacationPartyDataStore
    
    init(dataStore: VacationPartyDataStore){
        self.dataStore = dataStore
        
                dataStore.parties.sink { status in
                    switch status{
                    case .finished:
                        self.createPartyViewModelState = .partyCreated
                        print(self.createPartyViewModelState)
                    case .failure(let error):
                        self.createPartyViewModelState = .error
                        self.errorMessage = error.localizedDescription
                    }
                } receiveValue: { _ in }
                    .store(in: &cancelables)
    }
    
    func createNewParty(image: String, title: String, destination: String, startDate: String, endDate: String, budget: Int){
        createPartyViewModelState = .loading
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        
        guard let  formattedStartDate = dateFormatter.date(from: startDate) else {return}
        guard let formattedEndDate = dateFormatter.date(from: endDate) else {return}
        
        
        print(formattedEndDate - formattedStartDate)
        
        let newParty = VacationParty(budget: budget, desc: "", destination: destination, endDate: formattedEndDate, image: image, maximumUser: 5, name: title, startDate: formattedStartDate)
        dataStore.addParty(newParty: newParty)
        

    }
    
}
