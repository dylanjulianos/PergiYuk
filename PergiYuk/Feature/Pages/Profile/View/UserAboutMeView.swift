//
//  UserAboutMeView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 07/10/22.
//

import SwiftUI

struct UserAboutMeView: View {
    
    //MARK: - Properties
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    //MARK: - Lifecycle
    
    var body: some View {
        
        NavigationView {
            GeometryReader { _ in
                VStack {
                    //Title for Interest
                    VStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(.white)
                            .padding([.leading, .trailing])
                            .frame(width: width * 0.92, height: height * 0.15)
                            .shadow(radius: 1)
                            .overlay(
                            Text("Interest")
                                .font(.custom("Metropolis-SemiBold", size: 14))
                                .offset(y: -width * 0.1)
                                .background(
                                    Divider()
                                        .frame(width: width * 0.7, height: 2)
                                        .offset(y: -width * 0.06)
                                )
                            )
                        .padding(.bottom)
                    }
                    
                    //Title for Badges
                    VStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(.white)
                            .padding([.leading, .trailing])
                            .frame(width: width * 0.92, height: height * 0.15)
                            .shadow(radius: 1)
                            .overlay(
                            Text("Badges")
                                .font(.custom("Metropolis-SemiBold", size: 14))
                                .offset(y: -width * 0.1)
                                .background(
                                    Divider()
                                        .frame(width: width * 0.7, height: 2)
                                        .offset(y: -width * 0.06)
                                )
                            )
                        .padding(.bottom)
                    }
                    
                    NavigationLink("Edit Profile", destination: EditProfileView())
                        .font(.custom("Metropolis-SemiBold", size: 14))
                        .padding()
                        .background(Color("TMPrimaryColor"))
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
