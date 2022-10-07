//
//  BlueButton.swift
//  PergiYuk
//
//  Created by alvin anderson on 04/10/22.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.label.padding()
                .foregroundColor(Color.white)
                .background(.blue).cornerRadius(15)
                .font(.system(size: 17, weight: .bold))
        }
    }
}
