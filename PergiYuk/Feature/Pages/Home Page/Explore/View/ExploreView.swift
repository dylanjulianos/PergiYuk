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
    @State private var isShowingCreatePartyView = false
    @ObservedObject var tripCardViewModel: TripCardViewModel = TripCardViewModel(
        selectedDataStore: VacationPartyDataStore(repository: VacationPartyRepositoryDummyData()))
    
    
    init(){
        tripCardViewModel.getAllParty()
    }
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Image("rectangle-home")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.17)
                    .ignoresSafeArea()

                VStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .padding()
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $searchText)
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .onTapGesture {
                                self.isEditing = true
                            }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.white))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                    
                    
                    HStack{
                        Text("For You")
                            .padding(10)
                            .font(.custom("Metropolis-SemiBold", size: 16))
                            .frame(width: UIScreen.main.bounds.width, alignment: .center)
                        Spacer()
                    }
                    
                    ScrollView{
                        ForEach(tripCardViewModel.parties2){ party in
                            TripCardRowView(card: party)
                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("TravelMates")
                            .foregroundColor(.white)
                            .font(.custom("futura medium bt", size: 24))
                            .padding(.leading)
                            .padding(.top)
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
//                            tripCardViewModel.createNewParty(image: "asd", title: "asd", destination: "Asd", startDate: "asd", endDate: "Asd", budget: 12)
                        } label: {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing)
                        }
                    }
//                    ToolbarItem(placement: .navigationBarTrailing){
//                        NavigationLink(destination: CreatePartyView(tripCardViewModel: tripCardViewModel)) {
//                            Image(systemName: "plus.circle.fill")
//                                .foregroundColor(.white)
//                        }
//                    }
                }
                .padding(.top, UIScreen.main.bounds.height * 0.03)
            }
        }.navigationBarHidden(true)
            .accentColor(.blue)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ExploreView()
                .environmentObject(TripCardViewModel(selectedDataStore: VacationPartyDataStore(repository: VacationPartyRepositoryDummyData())))
            ExploreView().previewDisplayName("Dark").preferredColorScheme(.dark)
        }
    }
}
