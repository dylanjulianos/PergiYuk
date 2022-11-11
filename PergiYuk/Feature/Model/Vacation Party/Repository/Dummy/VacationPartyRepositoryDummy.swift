//
//  VacationPartyRepositoryDummy.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 08/11/22.
//

import Foundation
import Combine

class VacationPartyRepositoryDummyData: VacationPartyRepository{
    static let shared = VacationPartyRepositoryDummyData()
    
    var parties: [VacationParty] = []
    
    init() {
        let dummyParty1 = VacationParty(budget: 5000000, desc: "", destination: "Bali", endDate: "23 Nov 2022", image: "Travel Buddy", maximumUser: 4, name: "Pergi hiling di Bali", startDate: "19 Nov 2022")
        
        let dummyParty2 = VacationParty(budget: 2500000, desc: "", destination: "Puncak Bogor, Cisarua", endDate: "20 Nov 2022", image: "Travel Buddy", maximumUser: 4, name: "Trip to Puncak Bogor", startDate: "17 Nov 2022")
        
        let dummyParty3 = VacationParty(budget: 4000000, desc: "", destination: "Bali", endDate: "8 Nov 2022", image: "destination.lombok", maximumUser: 5, name: "Wisata Kuliner ke Bali", startDate: "3 Nov 2022")
        
        let dummyParty4 = VacationParty(budget: 4000000, desc: "", destination: "Gunung Bromo", endDate: "30 Nov 2022", image: "destination.lombok", maximumUser: 8, name: "Holiday di Bromo", startDate: "28 Nov 2022")
        
        parties.append(contentsOf: [dummyParty1,dummyParty2,dummyParty3,dummyParty4])
        
    }
    
    func getAllParty() -> Future<[VacationParty], Error> {
        return Future<[VacationParty], Error> { promise in
            let partiesResult: [VacationParty] = self.parties
            
            promise(.success(partiesResult))
        }
    }
    
    func addParty(party: VacationParty) -> Future<[VacationParty], Error> {
        return Future<[VacationParty], Error> { promise in
            if self.parties.contains(where: {$0.id == party.id }) {
                promise(.failure(VacationPartyRepositoryError.PartyAlreadyExists))
            }
            
            self.parties.append(party)
            promise(.success(self.parties))
        }
    }
    
    func removeParty(party: VacationParty) -> Future<VacationParty, Error> {
        return Future<VacationParty, Error> { promise in
            guard let partyIndex = self.parties.firstIndex( where: {
                eachParty in
                return eachParty.id == party.id
            }) else {
                promise(.failure(VacationPartyRepositoryError.PartyNotFound))
                return
            }
            
            let removedParty = self.parties.remove(at: partyIndex)
            promise(.success(removedParty))
        }
    }
    
    
    
    
}

