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
    //    var partyDataStore = VacationPartyDataStore(repository: VacationPartyRepositoryDummyData())
        

    @ObservedObject var route: Routing = Routing()
    var exploreViewModel: TripCardViewModel = TripCardViewModel(selectedDataStore: VacationPartyDataStore(repository: VacationPartyRepositoryDummyData()))
    
    var body: some Scene {
        WindowGroup {
            MainContent().environmentObject(route)
                .environmentObject(exploreViewModel)
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
    var userDataStore: UserDataStore = UserDataStore(repository: UserRepositoryDummyData())
    @EnvironmentObject var tripVM : TripCardViewModel
    
    var body: some View{
        switch routePosition.current {
        case .signIn:
            SignInView(dataStore: userDataStore)
                .animation(.easeInOut, value: routePosition.current)
        case .signUp:
            SignUpView(dataStore: userDataStore)
                .animation(.easeInOut, value: routePosition.current)
        case .explore:
            ExploreView().environmentObject(tripVM)
        }
    }
}
