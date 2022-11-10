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

}

