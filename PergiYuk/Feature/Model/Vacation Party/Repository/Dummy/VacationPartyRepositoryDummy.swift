//
//  VacationPartyRepositoryDummy.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 08/11/22.
//

import Foundation
import Combine

class VacationPartyRepositoryDummyData: VacationPartyRepository{
    
    var parties: [VacationParty] = []
    
    init() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        let dummyParty1 = VacationParty(budget: 5000000, desc: "", destination: "Bali", endDate: dateFormatter.date(from: "23/11/2022") ?? Date(), image: "Travel Buddy", maximumUser: 4, name: "Pergi hiling di Bali", startDate: dateFormatter.date(from: "19/11/2022") ?? Date())
        
        let dummyParty2 = VacationParty(budget: 2500000, desc: "", destination: "Puncak Bogor, Cisarua", endDate: dateFormatter.date(from: "20/11/2022") ?? Date(), image: "Travel Buddy", maximumUser: 4, name: "Trip to Puncak Bogor", startDate:  dateFormatter.date(from: "17/11/2022") ?? Date())
        
        let dummyParty3 = VacationParty(budget: 4000000, desc: "", destination: "Bali", endDate: dateFormatter.date(from: "8/11/2022") ?? Date(), image: "destination.lombok", maximumUser: 5, name: "Wisata Kuliner ke Bali", startDate: dateFormatter.date(from: "3/11/2022")  ?? Date())
        
        let dummyParty4 = VacationParty(budget: 4000000, desc: "", destination: "Gunung Bromo", endDate: dateFormatter.date(from: "30/11/2022") ?? Date(), image: "destination.lombok", maximumUser: 8, name: "Holiday di Bromo", startDate: dateFormatter.date(from: "28 Nov 2022") ?? Date())
        
        parties.append(contentsOf: [dummyParty1,dummyParty2,dummyParty3,dummyParty4])
    }
    
    func getAllParty() -> AnyPublisher<[VacationParty], Error> {
        return Future<[VacationParty], Error> { promise in
            let partiesResult: [VacationParty] = self.parties
            
            promise(.success(partiesResult))
        }.eraseToAnyPublisher()
    }
    
    func addParty(party: VacationParty) -> AnyPublisher<[VacationParty], Error> {
        return Future<[VacationParty], Error> { promise in
            if self.parties.contains(where: {$0.id == party.id }) {
                promise(.failure(VacationPartyRepositoryError.PartyAlreadyExists))
            }
            
            self.parties.insert(party, at: 0)
            promise(.success(self.parties))
        }
        .eraseToAnyPublisher()
    }
    
    func removeParty(party: VacationParty) -> AnyPublisher<VacationParty, Error> {
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
        .eraseToAnyPublisher()
    }
    
    
    
    
}

