//
//  UserProfileDetailsView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 04/10/22.
//

import Foundation

enum UserProfileDetailsView: Int, CaseIterable {
    
    var title: String {
        switch self {
        case .userAbout: return "About Me"
        case .userHistory: return "Trip History"
        }
    }
    
    case userAbout
    case userHistory
    
}

private func getDestination() {
    
}
