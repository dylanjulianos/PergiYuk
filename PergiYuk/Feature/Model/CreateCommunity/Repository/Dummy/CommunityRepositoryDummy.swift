//
//  CommunityRepositoryDummy.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 16/11/22.
//

import Foundation
import Combine

class CommunityRepositoryDummyData: CommunityRepository {
    var communities: [CreateCommunity] = []
    
    init() {
        let comm1 = CreateCommunity(image: "Travel Buddy", name: "Komunitas Hiking", desc: "Suka hiking", location: "Jakarta Selatan")
        let comm2 = CreateCommunity(image: "Travel Buddy", name: "Komunitas Pantai", desc: "Pantai is the best", location: "Bali")
        let comm3 = CreateCommunity(image: "Travel Buddy", name: "Komunitas Alam", desc: "Back to nature", location: "Papua")
        communities.append(contentsOf: [comm2, comm3, comm1])
    }
    
    func getAllCommunity() -> AnyPublisher<[CreateCommunity], Error> {
        return Future<[CreateCommunity], Error> { promise in
            let result = self.communities
            
            promise(.success(result))
        }.eraseToAnyPublisher()
    }
    
    func addCommunity(community: CreateCommunity) -> AnyPublisher<[CreateCommunity], Error> {
        return Future<[CreateCommunity], Error> { promise in
            if self.communities.contains(where: { community.name == $0.name} ) {
                promise(.failure(VacationPartyRepositoryError.PartyAlreadyExists))
            }
            
            self.communities.insert(community, at: 0)
            promise(.success(self.communities))
        }.eraseToAnyPublisher()
    }
    
    
}
