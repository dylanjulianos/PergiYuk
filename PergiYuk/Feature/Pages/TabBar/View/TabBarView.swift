//
//  TabBarView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 01/11/22.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case map
    case paperplane
    case person
}

struct TabBarView: View {
    
    //MARK: - Properties
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    //MARK: - Lifecycle
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .white : .white)
                        .font(.system(size: 24))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 60)
        .background(Color("TMPrimaryColor"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.map))
    }
}
