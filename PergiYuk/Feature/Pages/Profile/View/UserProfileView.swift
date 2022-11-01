//
//  UserProfileView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 04/10/22.
//

import SwiftUI

struct UserProfileView: View {
    
    //MARK: - Properties
    
    @State var currentProgress: CGFloat = 0.0
    
    //MARK: - Lifecycle
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                headerView
                ProfileTabBarView()
            }
        }
        .ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

//MARK: - Extensions

extension UserProfileView {
    var headerView: some View {
        //Profile
        ZStack(alignment: .top) {
            
            //Blue Background
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("TMPrimaryColor"))
            
            VStack {
                //Profile Picture
                Circle()
                    .frame(width: 164, height: 164, alignment: .center)
                    .foregroundColor(.orange)
                
                //Circular Progress Bar
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.white, lineWidth: 10)
                            Circle()
                                .stroke(Color.orange, lineWidth: 10)
                                .frame(width: 200*currentProgress)
                        }
                    )
                
                //Verification Status Message
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 220, height: 30)
                    .foregroundColor(Color.orange)
                    .offset(y: -30)
                    .padding(.bottom, -20)
                    .overlay(
                    Text("Verification Completed")
                        .offset(y: -19)
                        .font(.custom("Metropolis-SemiBold", size: 14))
                        .foregroundColor(.white)
                    )
                
                //User Name
                Text("Dylan Juliano Santoso")
                    .font(.custom("Metropolis-SemiBold", size: 24))
                    .frame(width: 300, height: 28)
                    .foregroundColor(.white)
                    .padding(5)
                
                //User Email
                Text("dylan.santoso" + "@binus.ac.id")
                    .font(Font.custom("Metropolis-Semibold", size: 14))
                    .frame(width: 300, height: 28)
                    .foregroundColor(.white)
                    .padding(5)
                
                HStack {
                    Spacer()
                    //User Instagram
                    Image("icon.ig")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .scaledToFit()
                    
                    Text("@justinbieber")
                        .font(Font.custom("Metropolis-Semibold", size: 14))
                        .frame(width: 125, height: 28)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    //User Twitter
                    Image("icon.twitter.box")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .scaledToFit()
                    
                    Text("@justinbieber")
                        .font(Font.custom("Metropolis-Semibold", size: 14))
                        .frame(width: 125, height: 28)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .offset(x: 0, y: 70)
        }
        .frame(height: 390)
        .padding(.bottom)
    }
}
