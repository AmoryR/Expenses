//
//  ImagePickerView.swift
//  Expenses
//
//  Created by Amory Rouault on 07/12/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

//struct ImagePickerView: UIViewControllerRepresentable {
//
//    @Binding var isPresented: Bool
//    @Binding var selectedImage: UIImage
//    
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
//        let controller = UIImagePickerController()
//        controller.delegate = context.coordinator
//        return controller
//    }
//
//    func makeCoordinator() -> ImagePickerView.Coordinator {
//        return Coordinator(parent: self)
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//        let parent: ImagePickerView
//
//        init(parent: ImagePickerView) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let selectedImage = info[.originalImage] as? UIImage {
//                self.parent.selectedImage = selectedImage
//            }
//
//            self.parent.isPresented = false
//        }
//
//    }
//
//    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
//
//    }
//
//}
