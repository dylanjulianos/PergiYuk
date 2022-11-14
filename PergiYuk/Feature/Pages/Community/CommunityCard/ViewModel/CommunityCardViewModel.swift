//
//  CommunityCardViewModel.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 14/11/22.
//

import Foundation
import Combine

class CommunityCardViewModel: ObservableObject {
    @Published var community: [CreateCommunity] = []
    
    func createNewCommunity(image: String, name: String, description: String, location: String) {
        
        let newCommunity = CreateCommunity(image: image, name: name, desc: "", location: location)
        //waiting for the data store for community
    }
}
