//
//  SignInView.swift
//  PergiYuk
//
//  Created by alvin anderson on 04/10/22.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email: String = ""
    @State var pass: String = ""
    @State var isShowingExploreView: Bool = false
    @EnvironmentObject var routePosition: Routing
    
    init(dataStore: UserDataStore){
        self.viewModel = SignInViewModel(dataStore: dataStore)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Image("Travel Buddy")
                VStack(spacing: UIScreen.main.bounds.size.height*0.02){
                    CustomTextField(placeHolder: "Email Address", value: $email)
                    CustomTextField(placeHolder: "Password", value: $pass)
                }
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Forgot Password?").bold()
                            .foregroundColor(.blue)
                    }
                }.frame(width: UIScreen.main.bounds.size.width*0.82)
                Button {
                    self.viewModel.signIn(email: email, password: pass)
                    
                } label: {
                    Text("Sign in")
                        .frame(width: UIScreen.main.bounds.size.width*0.75)
                }.buttonStyle(BlueButton())
                    .padding()
                    
                if viewModel.signInViewModelState == .error {
                    Text("\(viewModel.errorMessage)")
                        .foregroundColor(.red)
                    Spacer()
                        .frame(width: 5, height: 10)
                }
                
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
        SignInView(dataStore: UserDataStore(repository: UserRepositoryDummyData()))
    }
}
