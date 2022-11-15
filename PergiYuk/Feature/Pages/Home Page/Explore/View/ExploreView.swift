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
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Image("rectangle-home")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width*1, height: UIScreen.main.bounds.size.height*0.25)
                    .ignoresSafeArea()

                VStack{
                    Text("Where are you going?")
                        .font(.system(size: 35, weight: .semibold))
                        .foregroundColor(.white)
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchText)
                            .onTapGesture {
                                self.isEditing = true
                            }
                    }
                    .background(Rectangle()
                        .fill(.white)
                        .border(Color.gray, width: 1)
                        .cornerRadius(8))
                    HStack{
                        Text("For You")
                        Spacer()
                    }
                    ScrollView{
                        switch tripCardViewModel.exploreViewModelState{
                        case .partiesLoaded:
                            ForEach(tripCardViewModel.parties2){ party in
                                TripCardRowView(card: party)
                            }
                        case .loading:
                            Text("Loading")
                        case .error:
                            Text("Error loading data")
                        case .idle:
                            Text("idle")
                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("Travel Mates")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {

                        } label: {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.white)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: CreatePartyView(tripCardViewModel: tripCardViewModel)) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
            .onAppear{
                print(tripCardViewModel.parties2.count)
            }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(TripCardViewModel(selectedDataStore: VacationPartyDataStore(repository: VacationPartyRepositoryDummyData())))
    }
}

