//
//  ContentView.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 23/09/22.
//

import SwiftUI
enum TabBarr {
    case map
    case paperplane
    case person
}

struct ContentView: View {
    
    var selectedTab = TabBarr.person

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
        
        VStack {
            switch selectedTab{
            case .map:
                UserAboutMeView()
                
            case .person:
                UserProfileView(currentProgress: 0)
                
            case .paperplane:
                MyPartyView()
            }
            
            TabBarView()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
