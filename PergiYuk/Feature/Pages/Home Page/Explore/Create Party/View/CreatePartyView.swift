//
//  CreatePartyView.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import SwiftUI

struct CreatePartyView: View {
    
    @State private var partyName: String = ""
    @State private var partyDestination: String = ""
    @State private var partyDate: String = ""
    
    var body: some View {
        VStack{
            Text("Create New Party")
                .foregroundColor(.blue)
                .font(.system(size: 30, weight: .semibold))
                .padding()
            VStack(alignment: .leading){
                Text("Party Name")
                    .padding(.horizontal)
                CustomTextField(placeHolder: "Insert Party Name", value: $partyName)
            }.padding(.vertical,9)
            VStack(alignment: .leading){
                Text("Destination")
                    .padding(.horizontal)
                CustomTextField(placeHolder: "Insert Party Destination", value: $partyDestination)
            }.padding(.vertical,4)
            VStack(alignment: .leading){
                Text("Date")
                    .padding(.horizontal)
                CustomTextField(placeHolder: "Insert Party Date", value: $partyDate)
            }.padding(.vertical,4)
            
            Button {
                
            } label: {
                Text("Create Vacation Party")
                    .frame(width: 337)
            }.buttonStyle(BlueButton())
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Create New Party")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CreatePartyView_Previews: PreviewProvider {
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemRed
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        UINavigationBar.appearance().tintColor = .white
    }
    
    static var previews: some View {
        CreatePartyView()
    }
}
