//
//  TripCardModel.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import Foundation

struct TripCardModel : Identifiable, Hashable{
    let id: String = UUID().uuidString
    let image: String
    let title: String
    let destination: String
    let startDate: String
    let endDate: String
    let budget: Int
}
