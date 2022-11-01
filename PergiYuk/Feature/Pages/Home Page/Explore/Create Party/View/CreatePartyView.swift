//
//  CreatePartyView.swift
//  PergiYuk
//
//  Created by alvin anderson on 18/10/22.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    // To go back to view hierarchy - presentationMode
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct CreatePartyView: View {
    @EnvironmentObject var viewModel: CreatePartyViewModel
    @EnvironmentObject var tripCardViewModel: TripCardViewModel
    
    @State private var partyName: String = ""
    @State private var partyDestination: String = ""
    @State private var partyDate: String = ""
    @State private var partyEndDate: String = ""
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var partyImage: String = ""
    @State private var budget: Int = 0
    @Environment(\.dismiss) var isDismiss
    
    
    var body: some View {
        
        VStack{
            Text("Create New Party")
                .foregroundColor(.blue)
                .font(.system(size: 30, weight: .semibold))
                .padding()
            Button {
                showSheet = true
            } label: {
                Image(uiImage: self.image)
                        .resizable()
                        .cornerRadius(50)
                        .padding(.all, 4)
                        .frame(width: 360, height: 270)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Rectangle())
                        .padding(8)
            }.sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }

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
                createPressed()
                viewModel.createNewParty(image: partyImage, title: partyName, destination: partyDestination, startDate: partyDate, endDate: partyEndDate, budget: budget)
                isDismiss.callAsFunction()
            } label: {
//                Navigator.navigate(.explore){
                    Text("Create Vacation Party")
                        .frame(width: 337)
//                }
            }.buttonStyle(BlueButton())
                .padding()
            
            Spacer()
        }
        .padding()
    }
    
    func createPressed(){
        tripCardViewModel.createParty(image: partyImage, title: partyName, destination: partyDestination, startDate: partyDate, endDate: partyEndDate, budget: budget)
    }
}

struct CreatePartyView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePartyView()
    }
}
