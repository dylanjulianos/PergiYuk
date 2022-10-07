//
//  ExploreView.swift
//  PergiYuk
//
//  Created by alvin anderson on 07/10/22.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText: String = ""
    @State private var isEditing = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Where are you going?")
                    .font(.system(size: 35, weight: .semibold))
                TextField("Search", text: $searchText)
                    .padding(7)
                    .padding(.horizontal)
                    .padding(.vertical,5)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal,20)
                    .onTapGesture {
                        self.isEditing = true
                    }
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
                ScrollView{
                    HStack{
                        Text("For You")
                            .font(.system(size: 25, weight: .semibold))
                            .padding()
                            .padding(.horizontal)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Show more")
                                .padding()
                        }
                    }
                    Text("Card view")
                    HStack{
                        Text("Available Party")
                            .font(.system(size: 25, weight: .semibold))
                            .padding()
                            .padding(.horizontal)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Show more")
                                .padding()
                        }
                    }
                    Spacer()
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("Travel Mates")
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            
                        } label: {
                            //                            Image(systemName: "")
                            Text("Notif")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            
                        } label: {
                            Text("Add")
                        }
                        
                    }
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

