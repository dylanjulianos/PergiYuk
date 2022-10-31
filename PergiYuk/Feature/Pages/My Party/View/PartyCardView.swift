//
//  PartyCardView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 25/10/22.
//

import SwiftUI

struct PartyCardView: View {
    
    //MARK: - Properties
    
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
                        
                        Image("destination.lombok")
                            .resizable()
                            .cornerRadius(12)
                            .scaledToFit()
                            .frame(width: width * 0.8)
                        
                        Text("Hikingz")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
                        Text("Lombok Island")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.bottom, 8)
                        
                        Text("3/10/2022 - 6/10/2022 (4 Days)")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.bottom, 8)
                        
                        Text("Rp 3.000.000")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.bottom, 8)
                        
                        NavigationLink("Party Detail", destination: PartyDetailView())
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .foregroundColor(.white)
                            .frame(width: width * 0.8, height: 30)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
            )
            .frame(width: width * 0.9, height: height * 0.55)
    }
}

struct PartyCardView_Previews: PreviewProvider {
    static var previews: some View {
        PartyCardView()
    }
}
