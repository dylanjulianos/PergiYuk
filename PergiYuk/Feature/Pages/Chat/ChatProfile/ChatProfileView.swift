//
//  ChatProfileView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 13/12/22.
//

import SwiftUI

struct ChatProfileView: View {
    
    var imageUrl = URL(string: "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?cs=srgb&dl=pexels-suliman-sallehi-1704488.jpg&fm=jpg")
    
    var name = "Bali Roadtrip! 🎉"
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Text("8 members")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
//            Image(systemName: "ellipsis.circle")
//                .foregroundColor(.white)
//                .padding(.trailing, UIScreen.main.bounds.width * 0.01)
        }
        .padding()
        .background(Color("TMPrimaryColor"))
    }
}

struct ProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChatProfileView()
    }
}
