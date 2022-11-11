//
//  CreateCommunityView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 11/11/22.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct CreateCommunityView: View {
    
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    @available(iOS 16.0, *)
    var body: some View {
        VStack {
            Text("Create Community")
                .font(.custom("Metropolis-SemiBold", size: 20))
                .foregroundColor(Color("TMPrimaryColor"))
                .padding()
            
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .frame(width: width * 0.8, height: height * 0.3)
            }
            
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images,
                label: {
                Rectangle()
                    .cornerRadius(10)
                    .frame(width: width * 0.8, height: height * 0.3)
                    .foregroundColor(.gray)
                    .overlay(
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: width * 0.27, height: height * 0.1)
                    )
                })
            .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else {
                            print("Data is nil")
                        }
                        
                    case .failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
            
            
            Spacer()
        }
    }
}

struct CreateCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            CreateCommunityView()
        } else {
            // Fallback on earlier versions
        }
    }
}
