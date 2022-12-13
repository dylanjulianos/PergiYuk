//
//  Message.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 13/12/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
