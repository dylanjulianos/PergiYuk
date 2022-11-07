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
    
    var nameValue: String {
        switch self {
        case .map:
            return "Map"
            
        case .paperplane:
            return "Party"
            
        case .person:
            return "Profile"
        }
    }
}

struct TabBarView: View {
    
    //MARK: - Properties
    
    @State var selectedTab: Tab = .map
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var iconName: String {
        return selectedTab.rawValue
    }
    
    //MARK: - Selectors
    
    func returningView() -> AnyView {
        switch selectedTab {
        case .map:
            return AnyView(UserAboutMeView())
            
        case .paperplane:
            return AnyView(MyPartyView())
            
        case .person:
            return AnyView(UserProfileView())
        }
    }
    
    //MARK: - Lifecycle
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        Spacer()
                        VStack {
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
                            
                            Text(tab.nameValue)
                                .foregroundColor(.white)
                                .font(.custom("Metropolis-SemiBold", size: 10))
                                .offset(y: 10)
                        }
                        .padding(.top)
                        Spacer()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 60)
            .background(Color("TMPrimaryColor"))
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
