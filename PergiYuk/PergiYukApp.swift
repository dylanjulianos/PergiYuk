//
//  PergiYukApp.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 23/09/22.
//

import SwiftUI

@main
struct PergiYukApp: App {
    
    @State var exploreViewModel: ExploreViewModel = ExploreViewModel()
    
    var body: some Scene {
        WindowGroup {
            SignUpView()
                .environmentObject(exploreViewModel)
        }
    }
}
