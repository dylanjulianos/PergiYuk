//
//  SignUpView.swift
//  PergiYuk
//
//  Created by alvin anderson on 03/10/22.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    init(dataStore: UserDataStore) {
        self.viewModel = SignUpViewModel(dataStore: dataStore)
    }
    
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var pass: String = ""
    @State var conf: String = ""
    @State private var willMoveToSignIn: Bool = false
    @EnvironmentObject var routePosition: Routing
    
    var body: some View {
        VStack{
            Spacer()
            Image("Travel Buddy")
                .padding(.bottom,30)
            VStack{
                VStack(spacing: UIScreen.main.bounds.size.height*0.03){
                    CustomTextField(placeHolder: "Full Name", value: $name)
                    CustomTextField(placeHolder: "Email Address", value: $email)
                    CustomTextField(placeHolder: "Phone Number", value: $phone)
                    CustomTextField(placeHolder: "Password", value: $pass)
                    CustomTextField(placeHolder: "Confirm Password", value: $conf)
                }
                Text("By signing up, you agree to our Terms & Conditions and Privacy Policy")
                    .padding(.horizontal,3.6)
                    .padding(.bottom)
                    .font(.system(size: 14))
                    .frame(width: 340)
                
                Text("\(viewModel.errorMessage)")
                
                Button {
                    self.viewModel.signUp(email: email, name: name, phoneNum: phone, password: pass, conf: conf)
                } label: {
                    HStack{
                        if viewModel.signUpViewModelState == .loading{
                            ProgressView().progressViewStyle(CircularProgressViewStyle())
                        }
                        
                        Text("Sign Up")
                            .frame(width: UIScreen.main.bounds.size.width*0.75)
                    }
                }.buttonStyle(BlueButton())
                HStack{
                    Text("Already Join ?")
                    Button {
                        self.routePosition.current = .signIn
                    } label: {
                        HStack{
                            if viewModel.signUpViewModelState == .loading{
                                ProgressView().progressViewStyle(CircularProgressViewStyle())
                            }
                            Text("Sign in")
                        }
                    }
                }.frame(width: UIScreen.main.bounds.size.width*0.80)
            }
        }
        .padding()
        .onReceive(viewModel.$signUpViewModelState) { state in
            if state == .userCreated{
                self.routePosition.current = .signIn
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(dataStore: UserDataStore(repository: UserRepositoryDummyData()))
    }
}
