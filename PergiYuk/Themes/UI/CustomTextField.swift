//
//  CustomTextField.swift
//  PergiYuk
//
//  Created by alvin anderson on 04/10/22.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeHolder: String
    @Binding var value: String
    
    var body: some View {
        HStack{
            if(placeHolder == "Password" || placeHolder == "Confirm Password"){
                SecureInputView(placeHolder, text: $value)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.6)))
                    .padding(.vertical,9)
                    .padding(.horizontal,15)
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 16, weight: .regular))
            } else {
                TextField(placeHolder, text: $value)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.6)))
//                    .padding(.vertical,9)
                    .padding(.horizontal,15)
                    .textInputAutocapitalization(.never)
            }
        }
    }
}

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
}
