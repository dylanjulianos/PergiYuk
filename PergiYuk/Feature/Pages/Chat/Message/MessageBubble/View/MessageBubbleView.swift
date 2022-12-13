//
//  MessageBubbleView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 13/12/22.
//

import SwiftUI

struct MessageBubbleView: View {
    
    var message: Message
    
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .foregroundColor(.white)
                    .background(message.received ? Color.gray : Color.blue)
                    .cornerRadius(30)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.9, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, UIScreen.main.bounds.width * 0.04)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, UIScreen.main.bounds.width * 0.01)
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleView(message: Message(id: "123", text: "Codeeeeeee", received: false, timestamp: Date()))
    }
}
