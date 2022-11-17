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
                    .frame(width: UIScreen.main.bounds.size.width*1, height: UIScreen.main.bounds.size.height*0.18)
                    .ignoresSafeArea()

                VStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search all trips", text: $searchText)
                            .onTapGesture {
                                self.isEditing = true
                            }
                    }
                    .padding(.horizontal,UIScreen.main.bounds.size.width*0.1)
                    .padding(.vertical, UIScreen.main.bounds.size.height*0.01)
                    .background(Rectangle()
                        .fill(.white)
                        .border(Color.gray, width: 2)
                        .cornerRadius(8)
                        .padding(.horizontal,UIScreen.main.bounds.size.width*0.07)
                        )
                    
//                    HStack{
//                        Text("For You - \(self.tripCardViewModel.dataStore.parties.value.count)")
//                            .padding(.horizontal,40)
//                        Spacer()
//                    }
                    ScrollView{
                        ForEach(tripCardViewModel.parties2){ party in
                            TripCardRowView(card: party)
                        }
//                        switch tripCardViewModel.exploreViewModelState{
//                        case .partiesLoaded:
//                            ForEach(tripCardViewModel.parties2){ party in
//                                TripCardRowView(card: party)
//                            }
//                        case .loading:
//                            Text("Loading")
//                        case .error:
//                            Text("Error loading data")
//                        case .idle:
//                            Text("idle")
//                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("TravelMates")
                            .font(.custom("Metropolis-SemiBold", size: 25))
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            tripCardViewModel.createNewParty(image: "asd", title: "asd", destination: "Asd", startDate: "asd", endDate: "Asd", budget: 12)
                        } label: {
                            Image(systemName: "bell.fill")
                                .resizable()
                                
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
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

