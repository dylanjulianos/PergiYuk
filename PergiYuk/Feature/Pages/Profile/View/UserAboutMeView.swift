//
//  UserAboutMeView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 07/10/22.
//

import SwiftUI

struct UserAboutMeView: View {
    
    //MARK: - Lifecycle
    
    var body: some View {
        
        NavigationView {
            GeometryReader { _ in
                VStack {
                    
                    //Title for Interest
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .frame(width: 360, height: 125)
                        .shadow(radius: 1)
                        .overlay(
                        Text("Interest")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .offset(y: -28)
                        )
                    Rectangle()
                        .frame(width: 270, height: 1)
                        .offset(y: -80)
                        .foregroundColor(.gray)
                    
                    //Title for Badges
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .frame(width: 360, height: 125)
                        .shadow(radius: 1)
                        .overlay(
                        Text("Badges")
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .offset(y: -28)
                        )
                    Rectangle()
                        .frame(width: 270, height: 1)
                        .offset(y: -80)
                        .foregroundColor(.gray)
                    
                    NavigationLink("Edit Profile", destination: EditProfileView())
                        .font(.custom("Metropolis-SemiBold", size: 14))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 30)
                }
                .padding()
            }
        }
    }
}

struct UserAboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        UserAboutMeView()
    }
}
