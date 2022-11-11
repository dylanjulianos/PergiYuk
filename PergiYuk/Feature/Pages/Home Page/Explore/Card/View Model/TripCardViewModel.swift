//
//  ExploreViewModel.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import Foundation
import Combine

class TripCardViewModel : ObservableObject{

    @Published var parties: [TripCardModel] = []
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
//    var dataStore: UserDataStore = UserDataStore(repository: UserRepositoryDummyData())
    var dataStore: VacationPartyDataStore = VacationPartyDataStore(repository: VacationPartyRepositoryDummyData())
    
    init(){
        
        // coba implement data repo
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

//    func getParties(){
//        let newParties = [
//            TripCardModel(image: "Travel Buddy", title: "Pergi ke Bali", destination: "Bali", startDate: "12/3/2023", endDate: "15/3/2023", budget: 5000000),
//            TripCardModel(image: "Travel Buddy", title: "Pergi ke Solo", destination: "Solo", startDate: "11/1/2023", endDate: "13/1/2023", budget: 2500000),
//            TripCardModel(image: "Travel Buddy", title: "Seneng-seneng", destination: "Puncak", startDate: "14/6/2023", endDate: "20/6/2023", budget: 3000000)
//        ]
//        parties.append(contentsOf: newParties)
//    }
//
//    func deleteParty(indexSet: IndexSet){
//        parties.remove(atOffsets: indexSet)
//    }
//
//    func createParty(image: String, title: String, destination: String, startDate: String, endDate: String, budget: Int){
//        let newParty = TripCardModel(image: image, title: title, destination: destination, startDate: startDate, endDate: endDate, budget: budget)
//        parties.append(newParty)
//    }
}
