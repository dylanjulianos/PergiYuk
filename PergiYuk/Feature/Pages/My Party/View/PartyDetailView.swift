//
//  PartyDetailView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 25/10/22.
//

import SwiftUI

struct PartyDetailView: View {
    //MARK: - Properties
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    //MARK: - Lifecycle
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Hikingz")
                .font(.custom("FuturaMediumbt", size: 34))
                .foregroundColor(Color("TMPrimaryColor"))
                .padding(.leading, width * 0.26)
                .padding(.bottom)
            
            Image("destination.lombok")
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: width * 0.8)
            
            Text("Destination")
                .font(.custom("Metropolis-SemiBold", size: 14))
                .foregroundColor(Color("TMPrimaryColor"))
                .padding(.top, 8)
                .padding(.bottom, 8)
            
            Text("Lombok Island")
                .font(.custom("Metropolis-SemiBold", size: 16))
                .padding(.bottom, 8)
            
            Divider()
                .frame(width: width * 0.8, height: 1)
                .background(Color.gray)
            
            Text("Date")
                .font(.custom("Metropolis-SemiBold", size: 14))
                .foregroundColor(Color("TMPrimaryColor"))
                .padding(.top, 8)
                .padding(.bottom, 8)
            
            Text("3/10/2022 - 6/10/2022 (4 Days)")
                .font(.custom("Metropolis-SemiBold", size: 16))
                .padding(.bottom, 8)
            
            Divider()
                .frame(width: width * 0.8, height: 1)
                .background(Color.gray)
            
            Text("Party Members (2/4)")
                .font(.custom("Metropolis-SemiBold", size: 14))
                .foregroundColor(Color("TMPrimaryColor"))
                .padding(.top, 8)
                .padding(.bottom, 8)
            
            partyMember
        }
    }
}

struct PartyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PartyDetailView()
    }
}

//MARK: - Extensions

extension PartyDetailView {
    var partyMember: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("icon.ig")
                    .resizable()
                    .clipped()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color.blue, lineWidth: 2))
                
                Image("icon.twitter")
                    .resizable()
                    .clipped()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color("TMPrimaryColor"), lineWidth: 2))
            }
            .padding(.bottom, 8)
            
            Divider()
                .frame(width: width * 0.8, height: 1)
                .background(Color.gray)
            
            Text("Budget")
                .font(.custom("Metropolis-SemiBold", size: 14))
                .foregroundColor(Color("TMPrimaryColor"))
                .padding(.top, 8)
                .padding(.bottom, 8)
            
            Text("Rp 3.000.000")
                .font(.custom("Metropolis-SemiBold", size: 16))
                .padding(.bottom, 8)
        }
    }
}
