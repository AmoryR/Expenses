//
//  EditProfileView.swift
//  Expenses
//
//  Created by Amory Rouault on 01/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isShowingImagePicker: Bool = false
    @State var profileImage = UIImage()
    
    @EnvironmentObject var profileHandler: ProfileHandler
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                // ==== MAKE IT CLEAN === //
                // Image here
                Image(uiImage: profileImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .border(Color.black, width: 1)
                    .clipped()
                
                Button(action: {
                    self.isShowingImagePicker.toggle()
                }, label: {
                    Text("Edit profile picture")
                })
                .sheet(isPresented: $isShowingImagePicker, content: {
                    ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$profileImage)
                })
                // ==== MAKE IT CLEAN === //
                
                // Name
                EditProfileTextFieldView(title: "Name",
                                         placeholder: "name",
                                         textFieldValue: self.$profileHandler.profile.name)
                
                // Age
                EditProfileTextFieldView(title: "Age",
                                         placeholder: "0",
                                         keyboardType: .numberPad,
                                         textFieldValue: self.$profileHandler.profile.age)
                
                // Work
                EditProfileTextFieldView(title: "Work",
                                         placeholder: "work",
                                         textFieldValue: self.$profileHandler.profile.work)
                
                // Revenue
                EditProfileTextFieldView(title: "Revenue",
                                         placeholder: "0",
                                         keyboardType: .numberPad,
                                         textFieldValue: self.$profileHandler.profile.revenue)
            }
            .navigationBarTitle(Text("Edit profile"), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "xmark")
                }
            )
            
        }
    }
}

struct EditProfileTextFieldView: View {
    
    var title: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    
    @Binding var textFieldValue: String
    
    var body: some View {
        
        HStack {
            
            HStack {
                
                Spacer()
                
                Text(self.title)
                    .foregroundColor(.blue)
                
            }.frame(width: 74)
            
            // TextField
            TextField(self.placeholder, text: $textFieldValue)
                .keyboardType(keyboardType)

        }
        
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                self.parent.selectedImage = selectedImage
            }
            
            self.parent.isPresented = false
        }
        
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
}

/*
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}*/
