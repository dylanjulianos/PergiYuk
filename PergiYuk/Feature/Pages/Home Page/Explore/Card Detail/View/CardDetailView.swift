//
//  CardDetailView.swift
//  PergiYuk
//
//  Created by alvin anderson on 17/11/22.
//

import SwiftUI

struct CardDetailView: View {
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    @State var selected = 0
    let card: VacationParty
    @ObservedObject var cardDetailViewModel: CardDetailViewModel = CardDetailViewModel(
        selectedDataStore: VacationPartyDataStore(repository: VacationPartyRepositoryDummyData()))
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(card.name)
                        .font(.custom("futura medium bt", size: 34))
                        .foregroundColor(Color("TMPrimaryColor"))
                    Spacer()
                    
                    //                        NavigationLink("Create a party", destination: ExploreView())
                    //                        NavigationLink("Create a community", destination: CreateCommunityView())
                }
                .padding()
                
                CardDetailMenu(selected: self.$selected)
                
                ScrollView(.vertical, showsIndicators: false) {
                    if self.selected == 0 {
                        VStack(alignment: .leading, spacing: 20){
                            Image("destination.lombok")
                                .resizable()
                                .frame(height: height*0.3)
                                .aspectRatio(contentMode: .fit)
                                
                            Group{
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Destination")
                                        .foregroundColor(.blue)
                                    Text(card.destination)
                                }
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Start Date")
                                        .foregroundColor(.blue)
                                    Text(card.startDate.formatted())
                                }
                                VStack(alignment: .leading, spacing: 10){
                                    Text("End Date")
                                        .foregroundColor(.blue)
                                    Text(card.endDate.formatted())
                                }
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Budget")
                                        .foregroundColor(.blue)
                                    Text("IDR \(card.budget)")
                                }
                            }.padding(.horizontal, width*0.03)
                        }
                    } else {
//                        PartyCardView(card: MyPartyView.cardD)
//                        
//                        Divider()
//                            .frame(width: width * 0.5, height: 1)
//                            .background(Color.gray)
//                            .padding(.top)
                    }
                }
                .font(.custom("Metropolis-SemiBold", size: 16))
                
                Button {
                    
                } label: {
                    Text("Join")
                        .frame(width: width*0.7)
                }.buttonStyle(BlueButton())
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var cardsVacationParty = VacationParty(budget: 2500000, destination: "Jakarta", endDate: Date(), maximumUser: 4, name: "Trip Name", startDate: Date())
    static var previews: some View {
        CardDetailView(card: cardsVacationParty)
    }
}

struct CardDetailMenu: View {
    
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.selected = 0
            }, label: {
                ZStack {
                    VStack {
                        Text("Overview") .font(.custom("Metropolis-SemiBold", size: 14))
                            .foregroundColor(self.selected == 0 ? Color("TMPrimaryColor") : Color.black)
                        
                        Capsule()
                            .fill(self.selected == 0 ? Color.blue : Color.clear)
                            .frame(height: 2)
                            .padding(.leading)
                    }
                }
            })
            
            Button(action: {
                self.selected = 1
            }, label: {
                ZStack {
                    VStack {
                        Text("Itenerary") .font(.custom("Metropolis-SemiBold", size: 14))
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
