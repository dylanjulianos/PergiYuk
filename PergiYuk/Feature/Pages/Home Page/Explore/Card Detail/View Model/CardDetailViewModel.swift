//
//  CardDetailViewModel.swift
//  PergiYuk
//
//  Created by alvin anderson on 17/11/22.
//

import Foundation
import Combine
import SwiftUI

class CardDetailViewModel : ObservableObject{
    enum ExploreViewModelState{
        case idle
        case loading
        case error
        case partiesLoaded
    }

    
    @Published var parties2: [VacationParty] = []
    @Published var exploreViewModelState: ExploreViewModelState = .idle
    @Published var errorMessage: String = ""

    var cancelables: Set<AnyCancellable> = []
    var dataStore: VacationPartyDataStore
    
    init(selectedDataStore: VacationPartyDataStore){
        self.dataStore = selectedDataStore
        self.dataStore.parties.sink { status in
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
    }
    
    func getAllParty(){
        self.dataStore.getAllVacationParty()
    }
    

}
