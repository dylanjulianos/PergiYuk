//
//  EditProfileView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 05/10/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        VStack {
            Text("Edit Profile")
                .font(.custom("Metropolis-SemiBold", size: 34))
            
            ZStack {
                Circle()
                    .frame(width: 164, height: 164)
                    .foregroundColor(.gray)
                
                HStack {
                    
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .offset(x: 50, y: 60)
                        .overlay(
                            Image(systemName: "camera.fill")
                                .offset(x: 50, y: 60)
                                .foregroundColor(.white)
                        )
                }
                
            }
                        
            VStack(alignment: .leading) {
                
                Text("Display Name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(.blue)
                    .padding(.bottom)
                    .offset(x: -100)
                
                Text("Insert a display name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 345, height: 44)
                    )
                    .padding()
            }
            
            VStack(alignment: .leading) {
                
                Text("Display Name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(.blue)
                    .padding(.bottom)
                    .offset(x: -100)
                
                Text("Insert a display name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 345, height: 44)
                    )
            }
            
            VStack(alignment: .leading) {
                
                Text("Display Name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(.blue)
                    .padding(.bottom)
                    .offset(x: -100)
                
                Text("Insert a display name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 345, height: 44)
                    )
            }
            
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
