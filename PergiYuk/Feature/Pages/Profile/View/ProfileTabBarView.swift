//
//  ProfileTabBarView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 21/10/22.
//

import SwiftUI

struct ProfileTabBarView: View {
    
    //MARK: - Properties
    
    @State var selected = 0
    
    //MARK: - Lifecycle
    
    var body: some View {
        VStack {
            TabBar(selected: self.$selected)
            
            if self.selected == 0 {
                UserAboutMeView()
            } else {
                UserHistoryView()
            }
        }
    }
}

struct TabBar: View {
    
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.selected = 0
            }, label: {
                ZStack {
                    Text("About Me") .font(.custom("Metropolis-SemiBold", size: 14))
                        .foregroundColor(self.selected == 0 ? Color("TMPrimaryColor") : Color.black)
                    
                    Capsule()
                        .fill(Color.clear)
                }
                
            })
            
            Button(action: {
                self.selected = 1
            }, label: {
                ZStack {
                    Text("My History") .font(.custom("Metropolis-SemiBold", size: 14))
                        .foregroundColor(self.selected == 1 ? Color("TMPrimaryColor") : Color.black)
                    
                    Capsule()
                        .fill(Color.clear)
                }
            })
        }
    }
}

struct ProfileTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabBarView()
    }
}
