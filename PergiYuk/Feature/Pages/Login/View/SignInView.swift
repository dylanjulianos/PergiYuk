//
//  SignInView.swift
//  PergiYuk
//
//  Created by alvin anderson on 04/10/22.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var coreDataManager = CoreDataController()
    
    @State var email: String = ""
    @State var pass: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                Image("Travel Buddy")
                    .padding()
                CustomTextField(placeHolder: "Email Address", value: $email)
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
                Button {
                    signIn()
                } label: {
                    Text("Sign In")
                        .frame(width: 335)
                }.buttonStyle(BlueButton())
                    .padding()
                HStack {
                    Text("New to Travel Buddy?")
                    NavigationLink("Sign Up", destination: SignUpView())
                }
            }.padding()
        }.navigationBarHidden(true)
    }
    
    func signIn(){
        @FetchRequest(
            sortDescriptors: [],
            predicate: NSPredicate(format: "email == %@", email)
        ) var user: FetchedResults<User>
        
    }
    func forgotPass(){
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}