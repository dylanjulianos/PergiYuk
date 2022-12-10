//
//  CreateCommunityView.swift
//  PergiYuk
//
//  Created by Dylan Juliano Santoso on 11/11/22.
//

import SwiftUI
import PhotosUI

struct ImagePickerCreateCommunity: UIViewControllerRepresentable {
    
    //MARK: - Properties
    // To go back to view hierarchy - presentationMode
    @Environment(\.presentationMode) var presentationModeCreateCommunity
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage

    //MARK: - Selector
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerCreateCommunity>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerCreateCommunity>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePickerCreateCommunity

        init(_ parent: ImagePickerCreateCommunity) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationModeCreateCommunity.wrappedValue.dismiss()
        }
    }
}

struct CreateCommunityView: View {
    
    //MARK: - Properties
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    @EnvironmentObject var communityCardViewModel: CommunityCardViewModel
    
    @State private var image = UIImage()
    @State private var communityImage: String = ""
    @State private var communityName: String = ""
    @State private var communityDescription: String = ""
    @State private var communityLocation: String = ""
    @State private var showSheet = false
    
    @Environment(\.dismiss) var isDismiss
    
    //MARK: - Lifecycle
    
    var body: some View {
        VStack {
            Text("Create Community")
                .foregroundColor(.blue)
                .font(.custom("Metropolis-SemiBold", size: 20))
            Button {
                showSheet = true
            } label: {
                ZStack {
                    Image(uiImage: self.image)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: width * 0.85, height: height * 0.24)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }.sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
            .padding()

            VStack(alignment: .leading) {
                Text("Community Name")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .padding(.leading)
                CustomTextField(placeHolder: "Insert community name", value: $communityName)
                
                Text("Description")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .padding(.leading)
                CustomTextField(placeHolder: "Insert community description", value: $communityDescription)
                
                Text("Location")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .padding(.leading)
                CustomTextField(placeHolder: "Insert community location", value: $communityLocation)
            }
            
            Button {
//                communityCardViewModel.createNewCommunity(image: communityImage, name: communityName, description: communityDescription, location: communityLocation)
                isDismiss.callAsFunction()
            } label: {
                    Text("Create Community")
                    .font(.custom("Metropolis-SemiBold", size: 14))
                    .frame(width: width * 0.75)
            }.buttonStyle(BlueButton())
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct CreateCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCommunityView()
    }
}
