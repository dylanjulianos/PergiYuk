//
//  ExploreViewModel.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import Foundation

class TripCardViewModel : ObservableObject{
    
    @Published var parties: [TripCardModel] = []
    
    init(){
        getParties()
    }
    
    func getParties(){
        let newParties = [
            TripCardModel(image: "Travel Buddy", title: "Pergi ke Bali", destination: "Bali", startDate: "12/3/2023", endDate: "15/3/2023", budget: 5000000),
            TripCardModel(image: "Travel Buddy", title: "Pergi ke Solo", destination: "Solo", startDate: "11/1/2023", endDate: "13/1/2023", budget: 2500000),
            TripCardModel(image: "Travel Buddy", title: "Seneng-seneng", destination: "Puncak", startDate: "14/6/2023", endDate: "20/6/2023", budget: 3000000)
        ]
        parties.append(contentsOf: newParties)
    }
}
