//
//  User.swift
//  PergiYuk
//
//  Created by octavianus on 03/11/22.
//

import Foundation


struct User{
    var email: String
    var name: String
    var password: String
    var phoneNumber: String
    var profileImageURL: String?
    var status: String?
    var userDescription: String?
    var age: Int?
    var userParty: [VacationParty]?
}
