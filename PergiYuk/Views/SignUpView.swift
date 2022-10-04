//
//  SignUpView.swift
//  PergiYuk
//
//  Created by alvin anderson on 03/10/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var pass: String = ""
    @State var conf: String = ""
    @State private var willMoveToSignIn: Bool = false
 
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Image("Travel Buddy")
                    .padding(.bottom,30)
                CustomTextField(placeHolder: "Full Name", value: $name)
                CustomTextField(placeHolder: "Email Address", value: $email)
                CustomTextField(placeHolder: "Phone Number", value: $phone)
                CustomTextField(placeHolder: "Password", value: $pass)
                CustomTextField(placeHolder: "Confirm Password", value: $conf)
                Text("By signing up, you agree to our Terms & Conditions and Privacy Policy")
                    .padding(.horizontal,3.6)
                    .padding(.bottom)
                    .font(.system(size: 14))
                    .frame(width: 340)
                
                Button {
                    signUp()
                } label: {
                    Text("Sign Up")
                        .frame(width: 335)
                }.buttonStyle(BlueButton())
                
                HStack{
                    Text("Already joined?").bold()
                        .padding(.vertical,12)
                        .foregroundColor(.gray)
                    NavigationLink("Sign In", destination: SignInView())
                        .foregroundColor(.blue)
                        .font(.system(size: 17, weight: .bold))
                }
            }.padding()
        }.navigationBarHidden(true)
    }
    func signUp(){
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignUpView()
    }
}

