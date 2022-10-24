//
//  SignInView.swift
//  PergiYuk
//
//  Created by alvin anderson on 04/10/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var pass: String = ""
    @State var isShowingExploreView: Bool = false
    
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
                        forgotPass()
                    } label: {
                        Text("Forgot Password?").bold()
                            .foregroundColor(.blue)
                    }
                }.frame(width: 370)
                Button(action: {
                    print("Floating Button Click")
                }, label: {
                    NavigationLink(destination: ExploreView()) {
                         Text("Sign in")
                            .frame(width:335)
                     }
                }).buttonStyle(BlueButton())
                    .padding()
                HStack {
                    Text("New to Travel Buddy?")
                    NavigationLink("Sign Up", destination: SignUpView())
                }
            }.padding()
        }.navigationBarHidden(true)
    }
    
    func signIn(){
        
    }
    func forgotPass(){
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
