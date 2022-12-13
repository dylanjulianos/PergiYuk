//
//  MessageFieldView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 13/12/22.
//

import SwiftUI

struct MessageFieldView: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""
    var body: some View {
        HStack {
            TextFieldCustom(placeholder: Text("Type a message"), text: $message)
            
            Button {
                messagesManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(UIScreen.main.bounds.width * 0.01)
                    .background(Color("TMPrimaryColor"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, UIScreen.main.bounds.width * 0.03)
        .background(Color(.systemGray5))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        MessageFieldView()
            .environmentObject(MessagesManager())
    }
}

struct TextFieldCustom: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
