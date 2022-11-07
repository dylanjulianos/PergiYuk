//
//  SignInView.swift
//  PergiYuk
//
//  Created by alvin anderson on 04/10/22.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel = SignInViewModel()
    
    @State var email: String = ""
    @State var pass: String = ""
    @State var isShowingExploreView: Bool = false
    @EnvironmentObject var routePosition: Routing
    

    var body: some View {
        NavigationView {
            VStack{
                Image("Travel Buddy")
                    .padding()
                CustomTextField(placeHolder: "Email Address", value: $email)
                    .padding(.vertical,9)
                CustomTextField(placeHolder: "Password", value: $pass)
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Forgot Password?").bold()
                            .foregroundColor(.blue)
                    }
                }.frame(width: 370)
                Button {
                    self.viewModel.signIn(email: email, password: pass)
                    
                } label: {
                        Text("Sign in")
                            .frame(width: 337)
                }.buttonStyle(BlueButton())
                    .padding()
                Text("\(viewModel.errorMessage)")
                HStack {
                    Text("New to Travel Buddy?")
                    Button {
                        routePosition.current = .signUp
                    } label: {
                        Text("Sign Up")
                    }

                }
            }.padding()
        }.navigationBarHidden(true)
            .onReceive(viewModel.$signInViewModelState) { state in
                if state == .userLoggedIn {
                    routePosition.current = .explore
                }
            }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
