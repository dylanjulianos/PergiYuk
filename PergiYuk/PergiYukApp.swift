//
//  PergiYukApp.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 23/09/22.
//

import SwiftUI
import Firebase

class Routing: ObservableObject{
    @Published var current: RoutePosition = .signIn
}

@main
struct PergiYukApp: App {
    @ObservedObject var route: Routing = Routing()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainContent().environmentObject(route)
        }
    }
}

enum RoutePosition {
    case signIn
    case signUp
    case explore
}

struct MainContent: View{

    @EnvironmentObject var routePosition: Routing
    var userDataStore = UserDataStore.shared
    
    var body: some View{
        switch routePosition.current {
        case .signIn:
            SignInView(dataStore: userDataStore)
                .animation(.easeInOut, value: routePosition.current)
        case .signUp:
            SignUpView(dataStore: userDataStore)
                .animation(.easeInOut, value: routePosition.current)
        case .explore:
            TabBarView()
                .animation(.default, value: routePosition.current)
        }
    }
}
