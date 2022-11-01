//
//  TabBarView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 01/11/22.
//

import SwiftUI

struct TabBarView: View {
    
    //MARK: - Properties
    
    init() {
        customTabBar()
    }
    
    //MARK: - Lifecycle
    
    var body: some View {
        VStack {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Explore", systemImage: "map")
                            .environment(\.symbolVariants, .none)
                    }
                MyPartyView()
                    .tabItem {
                        Label("My Party", systemImage: "person.3").environment(\.symbolVariants, .none)

                    }
                UserProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                            .environment(\.symbolVariants, .none)
                    }
            }
            .accentColor(.white)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

//MARK: - Extensions

extension TabBarView {
    func customTabBar() {
        UITabBar.appearance().barTintColor = UIColor(named: "TMPrimaryColor")
        UITabBar.appearance().unselectedItemTintColor = .systemGray3
    }
}
