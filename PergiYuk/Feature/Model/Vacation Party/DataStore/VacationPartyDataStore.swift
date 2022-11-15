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
    var parties: CurrentValueSubject<[VacationParty],Error> = CurrentValueSubject([])
    
    init(repository: VacationPartyRepository) {
        self.repository = repository
        
    }
    
    func getAllVacationParty(){
        repository.getAllParty().sink { status in
            switch status {
            case .finished:
                print("Finished")
            case .failure(let error):
                print("error data store \(error)")
                
            }
        } receiveValue: { value in
            self.parties.send(value)
        }

    }
    
    func addParty(newParty: VacationParty){
        repository.addParty(party: newParty).sink { status in
            switch status {
            case .finished:
                print("")
            case .failure(let error):
                print("error")
            }
        } receiveValue: { value in
            self.parties.send(value)
        }

    
    }

}

