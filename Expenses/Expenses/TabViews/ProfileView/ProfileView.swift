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
                
                ZStack {
                    
                    // Background
                    Rectangle()
                        .frame(height: 160, alignment: .center)
                        .foregroundColor(Color.init("Header Detail"))
                    
                    VStack {
                        
                        // Profile image
                        Image("img-profile-default")
                            .resizable()
                            .frame(width: 120, height: 120, alignment: .center)
                            .clipShape(Circle())
                        
                        // Profile name
                        Text(self.profileHandler.profile.name)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom)
                        
                        // Expense category
                        VStack {
                            ProfileRow(title: "Age", value: String(self.profileHandler.profile.age))
                            Divider()
                            ProfileRow(title: "Work", value: self.profileHandler.profile.work)
                            Divider()
                            ProfileRow(title: "Revenue", value: "$\(String(self.profileHandler.profile.revenue))")
                        }
                        .padding()
                        .frame(width: 343, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 6)
                    }
                    
                }
                
                Spacer()
                
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileHandler())
    }
}
