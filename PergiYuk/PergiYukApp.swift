//
//  PergiYukApp.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 23/09/22.
//

import SwiftUI


class Routing: ObservableObject{
    @Published var current: RoutePosition = .signIn
}

@main
struct PergiYukApp: App {

    @ObservedObject var route: Routing = Routing()

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
    var partyDataStore = VacationPartyDataStore(repository: VacationPartyRepositoryDummyData())
    var userDataStore: UserDataStore = UserDataStore(repository: UserRepositoryDummyData())
    
    var body: some View{
        switch routePosition.current {
        case .signIn:
            SignInView(dataStore: userDataStore)
                .animation(.easeInOut, value: routePosition.current)
        case .signUp:
            SignUpView(dataStore: userDataStore)
                .animation(.easeInOut, value: routePosition.current)
        case .explore:
            ExploreView().environmentObject(TripCardViewModel(selectedDataStore: partyDataStore))
        }
    }
}
