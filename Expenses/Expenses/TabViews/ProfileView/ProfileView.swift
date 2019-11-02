//
//  ProfileView.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showEditProfile = false
    
    @EnvironmentObject var profileHandler: ProfileHandler
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    // Profile picture
                    Image("img-profile-default")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipShape(Circle())
                    
                    // Name
                    Text(self.profileHandler.profile.name)
                        .bold()
                }
                
                Form {
                    // Age
                    ProfileRow(title: "Age", value: String(self.profileHandler.profile.age))
                    
                    // Work
                    ProfileRow(title: "Work", value: self.profileHandler.profile.work)
                    
                    // Revenue
                    ProfileRow(title: "Revenue", value: "$" + String(self.profileHandler.profile.revenue))
                }
                
            }
            .navigationBarTitle(Text("Profile"))
            .navigationBarItems(trailing:
                Button(action: {
                    // Action
                    self.showEditProfile = true
                }) {
                    // Design
                    Text("Edit")
                }.sheet(isPresented: self.$showEditProfile) { EditProfileView()
                    .environmentObject(self.profileHandler)
                }
            )
        }
        
    }
}

/*
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: profileExample)
    }
}*/
