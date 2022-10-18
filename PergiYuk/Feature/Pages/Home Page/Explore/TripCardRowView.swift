//
//  TripCardRowView.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import SwiftUI

struct TripCardRowView: View {
    
//    var image: String
//    var title: String
//    var destination: String
//    var startDate: String
//    var endDate: String
//    var budget: Int
    
    let card: TripCardModel
    var body: some View {
        VStack{
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment: .leading){
                    Text(card.title)
                        .padding(.vertical,1)
                    Text(card.destination)
                        .padding(.vertical,1)
                    Text("\(card.startDate) - \(card.endDate) (... days)")
                        .padding(.vertical,1)
                    Text("IDR \(card.budget)")
                        .padding(.vertical,1)
                }
                Spacer()
            }
            
            Button {
                print("Hello")
            } label: {
                Text("Join")
                    .frame(width:303)
            }.buttonStyle(BlueButton())
        }
        .padding(.horizontal,50)
        .padding(.vertical,50)
        .font(.system(size: 15, weight: .medium))
    }
}

struct CardView_Previews: PreviewProvider {
    static var card1 = TripCardModel(image: "Travel Buddy", title: "Trip Name", destination: "Destination", startDate: "21/10/2022", endDate: "25/10/2022", budget: 2000000)
    
    static var previews: some View {
        TripCardRowView(card: card1)
    }
}

