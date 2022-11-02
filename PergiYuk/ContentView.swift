//
//  ContentView.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 23/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Tab = .map

    var body: some View {
        
//        VStack {
//            switch selectedTab {
//            case .map:
//                UserAboutMeView()
//
//            case .paperplane:
//                MyPartyView()
//
//            case .person:
//                UserProfileView()
//            }
//            TabBarView()
//        }
        
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .animation(nil, value: selectedTab)
                        }
                        .tag(tab)
                    }
                }
                TabBarView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
