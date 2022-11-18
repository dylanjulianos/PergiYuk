//
//  CreateCommunityViewModel.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 14/11/22.
//

import Foundation
import SwiftUI
import Combine

class CreateCommunityViewModel: ObservableObject {
    
    enum CreateCommunityViewModelState{
        case idle
        case loading
        case error
        case communityCreated
    }

    @Published var createCommunityViewModelState: CreateCommunityViewModelState = .idle
    @Published var errorMessage: String = ""
    
    var cancelables: Set<AnyCancellable> = []

    var dataStore: VacationPartyDataStore
    
    init(dataStore: VacationPartyDataStore){
        self.dataStore = dataStore
        
                dataStore.parties.sink { status in
                    switch status{
                    case .finished:
                        self.createCommunityViewModelState = .communityCreated
                        print(self.createCommunityViewModelState)
                    case .failure(let error):
                        self.createCommunityViewModelState = .error
                        self.errorMessage = error.localizedDescription
                    }
                } receiveValue: { _ in }
                    .store(in: &cancelables)
    }
    
    func createNewCommunity(image: String, name: String, desc: String, location: String) {
        createCommunityViewModelState = .loading
        
        let newCommunity = CreateCommunity(image: image, name: name, desc: "", location: location)
        
        //waiting for the data store of the new community
    }
    
}
