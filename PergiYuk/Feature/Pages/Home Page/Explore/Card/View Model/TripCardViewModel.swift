//
//  ExploreViewModel.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import Foundation
import Combine
import SwiftUI

class TripCardViewModel : ObservableObject{

//    @Published var parties: [TripCardModel] = []
    @Published var parties2: [VacationParty] = []
    
    enum ExploreViewModelState{
        case idle
        case loading
        case error
        case partiesLoaded
    }

    @Published var exploreViewModelState: ExploreViewModelState = .idle
    @Published var errorMessage: String = ""
    var cancelables: Set<AnyCancellable> = []
    var cancelables2: Set<AnyCancellable> = []

    var dataStore: VacationPartyDataStore 
    
    init(selectedDataStore: VacationPartyDataStore){
//        // yg lama
//        getParties()
        
        self.dataStore = selectedDataStore
        // coba implement data repo
        
        self.dataStore.parties
            .receive(on: RunLoop.main)
            .sink { status in
                print(status)
            switch status{
            case .finished:
                self.exploreViewModelState = .partiesLoaded
            case .failure(let error):
                self.exploreViewModelState = .error
                self.errorMessage = error.localizedDescription
            }
        } receiveValue: { party in
            self.parties2 = party
        }.store(in: &cancelables)
        
        self.dataStore.getAllVacationParty()
    }

    func createNewParty(image: String, title: String, destination: String, startDate: String, endDate: String, budget: Int){
        
        let newParty = VacationParty(budget: budget, desc: "", destination: destination, endDate: endDate, image: image, maximumUser: 5, name: title, startDate: startDate)
        dataStore.addParty(newParty: newParty)
        
//        self.dataStore.parties
//            .sink { status in
//                print(status)
//            switch status{
//            case .finished:
//                self.exploreViewModelState = .partiesLoaded
//            case .failure(let error):
//                self.exploreViewModelState = .error
//                self.errorMessage = error.localizedDescription
//            }
//        } receiveValue: { party in
//            print(party)
//            self.parties2 = party
//        }.store(in: &cancelables2)

        self.dataStore.getAllVacationParty()
        
    }
}
