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
    
    @EnvironmentObject var profileHandler: ProfileHandler
    
    var body: some View {
        
        NavigationView {
            
            Form {
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
            // Title
            Text(self.title)
                .foregroundColor(.blue)
            
            // TextField
            TextField(self.placeholder, text: $textFieldValue)
                .keyboardType(keyboardType)
            
        }
    }
}

/*
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}*/
