//
//  MyPartyView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 25/10/22.
//

import SwiftUI

struct MyPartyView: View {
    //MARK: - Properties
    
    @State var selected = 0
    var width = UIScreen.main.bounds.width
    
    //MARK: - Lifecycle
    
    var body: some View {
        VStack {
            HStack {
                Text("My Party")
                    .font(.custom("FuturaMediumbt", size: 34))
                    .foregroundColor(Color("TMPrimaryColor"))
                Spacer()
                
                Menu {
                    Button("Create a party", action: createParty)
                    Button("Create a community", action: createCommunity)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
            }
            .padding()
            
            Option(selected: self.$selected)
            
            ScrollView(.vertical, showsIndicators: false) {
                if self.selected == 0 {
                    PartyCardView()
                    
                    Divider()
                        .frame(width: width * 0.5, height: 1)
                        .background(Color.gray)
                        .padding(.top)
                    
                    CommunityCardView()
                } else {
                    PartyCardView()
                    
                    Divider()
                        .frame(width: width * 0.5, height: 1)
                        .background(Color.gray)
                        .padding(.top)
                }
            }
        }
    }
    
    func createParty() {}
    func createCommunity() {}
}

struct Option: View {
    
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.selected = 0
            }, label: {
                ZStack {
                    VStack {
                        Text("Available") .font(.custom("Metropolis-SemiBold", size: 14))
                            .foregroundColor(self.selected == 0 ? Color("TMPrimaryColor") : Color.black)
                        
                        Capsule()
                            .fill(self.selected == 0 ? Color.blue : Color.clear)
                            .frame(height: 2)
                            .padding(.leading)
                    }
                }
            })
            
            Divider()
                .frame(width: 2, height: 50)
                .background(Color.gray)
            
            Button(action: {
                self.selected = 1
            }, label: {
                ZStack {
                    VStack {
                        Text("Pending") .font(.custom("Metropolis-SemiBold", size: 14))
                            .foregroundColor(self.selected == 1 ? Color("TMPrimaryColor") : Color.black)
                        
                        Capsule()
                            .fill(self.selected == 1 ? Color.blue : Color.clear)
                            .frame(height: 2)
                            .padding(.trailing)
                    }
                }
            })
        }
    }
}

struct MyPartyView_Previews: PreviewProvider {
    static var previews: some View {
        MyPartyView()
    }
}
