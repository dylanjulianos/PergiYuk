//
//  VacationParty.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 07/11/22.
//

import Foundation

struct VacationParty: Identifiable{
    let id: String = UUID().uuidString
    var budget: Int
    var currentUser: [User]?
    var desc: String?
    var destination: String
    var endDate: Date
    var image: String?
    var maximumUser: Int
    var name: String
    var startDate: Date
}
