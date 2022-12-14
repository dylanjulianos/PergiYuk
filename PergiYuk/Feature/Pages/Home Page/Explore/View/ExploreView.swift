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
    @EnvironmentObject var tripCardViewModel: TripCardViewModel
    
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .topLeading){
                Image("rectangle-home")
                    .resizable()
                    .frame(width: 450, height: 240)
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
                    
                    .padding(9)
                    .padding(.horizontal)
                    .padding(.vertical,2.5)
                    .background(Rectangle()
                        .fill(.white)
                        .border(Color.gray, width: 1)
                        .cornerRadius(8))
                    .padding(.horizontal,30)
                    HStack{
                        Text("For You")
                            .padding(.horizontal,40)
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
                        NavigationLink(destination: CreatePartyView().environmentObject(tripCardViewModel)) {
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

