//
//  CommunityDataStore.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 16/11/22.
//

import Foundation
import Combine

class CommunityDataStore {
    var repository: CommunityRepository
    var communities: CurrentValueSubject<[CreateCommunity],Error> = CurrentValueSubject([])
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func getCommunities(){
        repository.getAllCommunity().sink { completion in
            print("getCommunities DS completion: \(completion)")
        } receiveValue: { value in
            self.communities.send(value)
        }
    }

    func addCommunity(community: CreateCommunity){
        repository.addCommunity(community: community).sink { completion in
            print("addCommunity DS completion: \(completion)")
        } receiveValue: { value in
            self.communities.send(value)
        }
    }
}
