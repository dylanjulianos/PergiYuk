//
//  ProfileDetailsViewModel.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 04/10/22.
//

import SwiftUI


class ProfileDetailsViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var interest: [Interests] = []
}

struct Interests: Identifiable {
    var id = UUID()
    let title: String
}

