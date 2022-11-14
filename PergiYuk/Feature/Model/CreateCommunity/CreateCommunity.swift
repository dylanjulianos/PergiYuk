//
//  CreateCommunity.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 14/11/22.
//

import Foundation

struct CreateCommunity: Identifiable {
    let id: String = UUID().uuidString
    var image: String?
    var name: String
    var desc: String
    var location: String
}
