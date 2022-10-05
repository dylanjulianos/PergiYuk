//
//  UserProfileView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 04/10/22.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var currentProgress: CGFloat = 0.0
    @State var selectedOption: UserProfileDetailsView = .userAbout
    @Namespace var animation

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                //Profile
                headerView
                profileDetailsBar
                userDetails
                
                //Button Edit Profile
                Button {
                    print("pressed")
                } label: {
                    Text("Edit Profile")
                        .font(.custom("Metropolis-SemiBold", size: 14))
                        .frame(width: 220, height: 20)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationView {
                    Text("Edit Profile")
                        .navigationTitle("Edit Profile")
                }
                
                Spacer()
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

extension UserProfileView {
    var headerView: some View {
        
        //Profile
        ZStack(alignment: .top) {
            
            //Blue Background
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
            
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
                    //User Instagram
                    Text("@justinbieber")
                        .font(Font.custom("Metropolis-Semibold", size: 14))
                        .frame(width: 125, height: 28)
                        .foregroundColor(.white)
                    
                    //User Twitter
                    Text("@justinbieber")
                        .font(Font.custom("Metropolis-Semibold", size: 14))
                        .frame(width: 125, height: 28)
                        .foregroundColor(.white)
                }
            }
            .offset(x: 0, y: 70)
        }
        .frame(height: 390)
    }
    
    var profileDetailsBar: some View {
        //User Details pt. 1
        HStack {
            ForEach(UserProfileDetailsView.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(Font.custom("Metropolis-Semibold", size: 14))
                        .foregroundColor(selectedOption == item ? .blue : .black)
                    
                    //Selected Option Animation
                    if selectedOption == item {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "option", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 2)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedOption = item
                    }
                }
            }
        }
        .offset(y: 10)
    }
    
    var userDetails: some View {
        //Interest
        VStack(alignment: .center) {
            //Title for Interest
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.white)
                .padding()
                .frame(width: 360, height: 125)
                .shadow(radius: 1)
                .overlay(
                Text("Interest")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .offset(y: -28)
                )
            
            //Title for Badges
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.white)
                .padding()
                .frame(width: 360, height: 125)
                .shadow(radius: 1)
                .overlay(
                Text("Badges")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .offset(y: -28)
                )
        }
    }
}
