//
//  ContentView.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 23/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .map
    
    var body: some View {
        VStack {
            Spacer()
            TabBarView(selectedTab: $selectedTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
