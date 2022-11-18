//
//  TripCardRowView.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import SwiftUI

struct TripCardRowView: View {
    
    let card: VacationParty
    var body: some View {
        VStack{
            Image(card.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment: .leading){
                    Text(card.name)
                        .padding(.vertical,1)
                    Text(card.destination)
                        .padding(.vertical,1)
                    Text("\(card.startDate.formatted(date: .abbreviated, time: .omitted)) - \(card.endDate.formatted(date: .abbreviated, time: .omitted)) (\(Int(card.endDate-card.startDate)/(3600*24)) days) ")
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
    
    static var cardVacationParty = VacationParty(budget: 2500000, destination: "Jakarta", endDate: Date() , maximumUser: 4, name: "Trip Name", startDate: Date())
    static var previews: some View {
        TripCardRowView(card: cardVacationParty)
    }
}

