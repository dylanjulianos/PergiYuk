//
//  UserHistoryView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 05/10/22.
//

import SwiftUI

struct UserHistoryView: View {
    
    //MARK: - Properties
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    //MARK: - Lifecycle
    
    var body: some View {
        
        GeometryReader { _ in
            VStack(alignment: .center) {
                //Title for Feedback Rating
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(.white)
                    .padding([.leading, .trailing])
//                    .frame(width: 360, height: 125)
                    .frame(width: width * 0.92, height: height * 0.15)
                    .shadow(radius: 1)
                    .overlay(
                    Text("Feedback Rating")
                        .font(.custom("Metropolis-SemiBold", size: 14))
                        .offset(y: -28)
                    )
                Rectangle()
                    .frame(width: 270, height: 1)
                    .offset(y: -80)
                    .foregroundColor(.gray)
                
                //Title for History
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(.white)
                    .padding([.leading, .trailing])
//                    .frame(width: 360, height: 125)
                    .frame(width: width * 0.92, height: height * 0.15)
                    .shadow(radius: 1)
                    .overlay(
                    Text("Trip History")
                        .font(.custom("Metropolis-SemiBold", size: 14))
                        .offset(y: -28)
                    )
                Rectangle()
                    .frame(width: 270, height: 1)
                    .offset(y: -80)
                    .foregroundColor(.gray)
                    
            }
            .padding()
        }
    }
}

struct UserHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryView()
    }
}
