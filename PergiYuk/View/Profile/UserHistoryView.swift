//
//  UserHistoryView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 05/10/22.
//

import SwiftUI

struct UserHistoryView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            //Title for Feedback Rating
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.white)
                .padding()
                .frame(width: 360, height: 125)
                .shadow(radius: 1)
                .overlay(
                Text("Feedback Rating")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .offset(y: -28)
                )
            
            //Title for History
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.white)
                .padding()
                .frame(width: 360, height: 125)
                .shadow(radius: 1)
                .overlay(
                Text("Trip History")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .offset(y: -28)
                )
        }
    }
}

struct UserHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryView()
    }
}
