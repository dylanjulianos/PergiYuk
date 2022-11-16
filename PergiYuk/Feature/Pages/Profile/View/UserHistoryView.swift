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
                VStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .frame(width: width * 0.92, height: height * 0.15)
                        .shadow(radius: 1)
                        .overlay(
                        Text("Feedback Rating")
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
                
                //Title for History
                VStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .frame(width: width * 0.92, height: height * 0.15)
                        .shadow(radius: 1)
                        .overlay(
                        Text("History")
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
