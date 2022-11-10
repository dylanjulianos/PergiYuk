//
//  Coba.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 08/11/22.
//

import SwiftUI

struct Coba: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "TMPrimaryColor")
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    @State var selectedTab = "One"
    
    var body: some View {

            TabView(selection: $selectedTab) {
                UserAboutMeView()
                    .tabItem {
                        if selectedTab == "One" {
                            Image(systemName: "map.fill")
                        } else {
                            Image(systemName: "map")
                                .environment(\.symbolVariants, .none)
                        }
                        Text("Explore")
                    }
                    .tag("One")

                MyPartyView()
                    .tabItem {
                        if selectedTab == "Two" {
                            Image(systemName: "person.3.fill")
                        } else {
                            Image(systemName: "person.3")
                                .environment(\.symbolVariants, .none)
                        }
                        Text("Party")
                    }
                    .tag("Two")

                UserProfileView()
                    .tabItem {
                        if selectedTab == "Three" {
                            Image(systemName: "person.fill")
                        } else {
                            Image(systemName: "person")
                                .environment(\.symbolVariants, .none)
                        }
                        Text("Profile")
                    }
                    .tag("Three")
            }
            .accentColor(.white)
    }
}

struct Coba_Previews: PreviewProvider {
    static var previews: some View {
        Coba()
    }
}
