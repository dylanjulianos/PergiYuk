//
//  VacationPartyDataStore.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 07/11/22.
//

import Foundation
import Combine

class VacationPartyDataStore{
    var repository: VacationPartyRepository
    var parties = PassthroughSubject<[VacationParty],Error>()
    
    init(repository: VacationPartyRepository) {
        print("Data store created")
        self.repository = repository
    }
    
    func getAllVacationParty(){
        repository.getAllParty().sink { status in
            switch status {
            case .finished:
                self.parties.send(completion: .finished)
            case .failure(let error):
                self.parties.send(completion: .failure(error))
            }
        } receiveValue: { value in
            self.parties.send(value)
        }
    }
    
    func addParty(newParty: VacationParty){
        repository.addParty(party: newParty).sink { status in
            print("Repository status: \(status)")
            switch status {
            case .finished:
//                self.parties.send(completion: .finished)
                print("Finish")
            case .failure(let error):
                self.parties.send(completion: .failure(error))
            }
        } receiveValue: { value in
            self.parties.send(value)
        }

    
    }

}

