//
//  PartyCardView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 25/10/22.
//

import SwiftUI

struct PartyCardView: View {
    
    //MARK: - Properties
    
    let card: TripCardModel
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    //MARK: - Lifecycle
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.clear)
            .overlay(
                NavigationView {
                    VStack(alignment: .leading) {
                        Text("Party")
                            .font(.custom("FuturaMediumbt", size: 24))
                            .padding(.bottom)
                        
                        Image("\(card.image)")
                            .resizable()
                            .cornerRadius(12)
                            .scaledToFit()
                            .frame(width: width * 0.8)
                        
                        Text("\(card.title)")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
                        Text("\(card.destination)")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.bottom, 8)
                        
                        Text("\(card.startDate) - \(card.endDate) ( Days)")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.bottom, 8)
                        
                        Text("Rp \(card.budget)")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.bottom, 8)
                        
                        NavigationLink("Party Detail", destination: PartyDetailView())
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .foregroundColor(.white)
                            .frame(width: width * 0.8, height: 30)
                            .background(Color("TMPrimaryColor"))
                            .cornerRadius(8)
                    }
                }
            )
            .frame(width: width * 0.9, height: height * 0.55)
    }
}

struct PartyCardView_Previews: PreviewProvider {
    
    static var cardD = TripCardModel(image: "destination.lombok", title: "Hiking Community", destination: "Lombok Island", startDate: "20/10/2022", endDate: "23/10/2022", budget: 4000000)
    
    static var previews: some View {
        PartyCardView(card: cardD)
    }
}
