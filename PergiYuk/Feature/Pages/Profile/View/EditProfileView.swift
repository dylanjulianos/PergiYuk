//
//  EditProfileView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 05/10/22.
//

import SwiftUI

struct EditProfileView: View {
    
    //MARK: - Properties
    
    @State private var displayName: String = ""
    @State private var email: String = ""
    @State private var socialMedia1: String = ""
    @State private var socialMedia2: String = ""
    @ObservedObject var phoneNumber = NumbersOnly()
    @StateObject var viewModel = ProfileDetailsViewModel()
    @State var text = ""
    
    //MARK: - Lifecycle
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                editProfileContent
            }
        }
    }
    
    //MARK: - Selectors
    
    func addToList() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let newInterest = Interests(title: text)
        viewModel.interest.append(newInterest)
        text = ""
    }
}

//MARK: - Class For Numbers Only While Input The Phone Number

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

//MARK: - Extensions

extension EditProfileView {
    
    var editProfileContent: some View {
        VStack {
            //Title
            Text("Edit Profile")
                .font(.custom("Metropolis-SemiBold", size: 34))
                .foregroundColor(Color("TMPrimaryColor"))
                .padding()
                .padding(.bottom, 10)
            
            ZStack {
                //Display Picture
                Circle()
                    .frame(width: 164, height: 164)
                    .foregroundColor(.gray)
                
                HStack {
                    Button(action: {
                        print("pressed")
                    }, label: {
                        //Camera Button
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("TMPrimaryColor"))
                            .overlay(
                            Image(systemName: "camera.fill")
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            )
                    }
                    ).offset(x: 50, y: 60)
                }
            }
                        
            VStack(alignment: .leading) {
                //Display Name
                Text("Display Name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(Color("TMPrimaryColor"))
                    .padding(.leading)
                    .padding(.top, 10)
                
                ZStack {
                    TextField("Enter a display name", text: $displayName)
                        .padding([.leading, .trailing])
                }
                .textFieldStyle(customOvalTextField())
                .padding(.bottom)
            }
            
            VStack(alignment: .leading) {
                //Email
                Text("Email")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(Color("TMPrimaryColor"))
                    .padding(.leading)
                
                ZStack {
                    TextField("Enter your email", text: $email)
                        .padding([.leading, .trailing])
                }
                .textFieldStyle(customOvalTextField())
                .padding(.bottom)
            }
            
            VStack(alignment: .leading) {
                //Phone Number
                Text("Phone Number")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(Color("TMPrimaryColor"))
                    .padding(.leading)
                
                ZStack {
                    TextField("Enter your phone number", text: $phoneNumber.value)
                        .padding([.leading, .trailing])
                        .keyboardType(.decimalPad)
                }
                .textFieldStyle(customOvalTextField())
                .padding(.bottom)
            }
            
            VStack(alignment: .leading) {
                Text("Interest")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(Color("TMPrimaryColor"))
                    .padding(.leading)
                
                Section(header: Text("")) {
                    TextField("Ex. Climbing, Hiking, Surfing, etc", text: $text)
                        .textFieldStyle(.roundedBorder)
                        .padding([.leading, .trailing])
                    
                    Button(action: {
                        addToList()
                    }, label: {
                        VStack(alignment: .leading) {
                            Text("Add")
                                .bold()
                                .frame(width: 100, height: 32)
                                .background(Color("TMPrimaryColor"))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .font(.custom("Metropolis-SemiBold", size: 14))
                                .padding(.leading, 140)
                                .padding(.bottom)
                        }
                    })
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.interest) { interest in
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.orange)
                                    .frame(width: 180, height: 40)
                                InterestRow(title: interest.title)
                                    .foregroundColor(.white)
                                    .font(.custom("Metropolis-SemiBold", size: 14))
                            }
                        }
                    }
                }
                .padding()
            }
            
            VStack(alignment: .leading) {
                //Social Media Instagram
                Text("Social Media")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .foregroundColor(Color("TMPrimaryColor"))
                    .padding(.leading)
                
                HStack {
                    Image("icon.ig")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .padding(.leading, 20)
                        .padding(.trailing, 7)
                    
                    ZStack {
                        TextField("Enter your username", text: $socialMedia1)
                            .padding(.trailing)
                    }
                    .textFieldStyle(customOvalTextField())
                }
                
                //Social Media Twitter
                HStack {
                    Image("icon.twitter")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .padding(.leading, 20)
                        .padding(.trailing, 7)
                    
                    ZStack {
                        TextField("Enter your username", text: $socialMedia2)
                            .padding(.trailing)
                    }
                    .textFieldStyle(customOvalTextField())
                }
                .padding(.top, 8)
            }
            
            //Save Button
            Button {
                print("pressed")
            } label: {
                Text("Save")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .frame(width: 344, height: 32)
            }
            .padding()
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
    
    //Struct for Custom Oval TextField
    struct customOvalTextField: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(10)
                .background(.clear)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .font(.custom("Metropolis-SemiBold", size: 12))
                )
        }
    }
    
    //Struct for Interest Row
    struct InterestRow: View {
        let title: String
        
        var body: some View {
            Label(
                title: { Text(title) }, icon: { Image(systemName: "seal.fill") }
            )
        }
    }
    
    struct MultipleSelectionRow: View {
        var title: String
        var isSelected: Bool
        var action: () -> Void
        
        var body: some View {
            Button(action: self.action) {
                HStack {
                    Text(self.title)
                    
                    if self.isSelected {
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
