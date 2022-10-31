//
//  CommunityCardView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 25/10/22.
//

import SwiftUI

struct CommunityCardView: View {
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
                        Text("Community")
                            .font(.custom("FuturaMediumbt", size: 24))
                            .padding(.bottom)
                        
                        Image("destination.lombok")
                            .resizable()
                            .cornerRadius(12)
                            .scaledToFit()
                            .frame(width: width * 0.8)
                        
                        Text("Viking")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
                        Text("Based On Tangerang")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .padding(.bottom, 8)
                        
                        NavigationLink("Community Detail", destination: PartyDetailView())
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .foregroundColor(.white)
                            .frame(width: width * 0.8, height: 30)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
            )
            .frame(width: width * 0.9, height: height * 0.5)
    }
}

struct CommunityCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCardView()
    }
}
