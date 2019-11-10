//
//  ContentView.swift
//  Expenses
//
//  Created by Amory Rouault on 24/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    var expensesHandler = ExpensesHandler()
    var profileHandler = ProfileHandler()
 
    var body: some View {
        TabView(selection: $selection){
            ExpensesView()
                .environmentObject(expensesHandler)
                .tabItem {
                    VStack {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Expenses")
                    }
                }
                .tag(0)
            SavingsView()
                .environmentObject(expensesHandler)
                .environmentObject(profileHandler)
                .tabItem {
                    VStack {
                        Image(systemName: "chart.pie.fill")
                        Text("Savings")
                    }
                }
                .tag(1)
            ProfileView()
                .environmentObject(profileHandler)
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle.fill")
                        Text("Profile")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
// MARK: Expenses
enum TypeExpense {
    case fixed
    case variable
}

struct Expense {
    var type: TypeExpense
    var title: String
    var amount: Int
    var category: String
}


// MARK: Savings
struct SavingsView: View {
    var body: some View {
        Text("Savings")
    }
}

// MARK: Profile
struct ProfileView: View {
    
    @State private var showEditProfile = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                Image("photo-profile")
                    .resizable()
                    .frame(width: 180, height: 180, alignment: .center)
                    .clipShape(Circle())
                
                Text("Amory Rouault")
                    .bold()
                    
                List {
                    ProfileRow()
                    ProfileRow()
                    ProfileRow()
                }
                
            }
        .navigationBarTitle(Text("Profile"))
        .navigationBarItems(trailing:
            Button(action: {
                // Action
                self.showEditProfile = true
            }) {
                // Design
                Image(systemName: "pencil")
            }.sheet(isPresented: self.$showEditProfile) { EditProfileModalView() }
        )
        }
    }
}

struct ProfileRow: View {
    var body: some View {
        HStack {
            Text("Age")
            
            Spacer()
            
            Text("21 y.o").foregroundColor(Color.gray)
        }
        
    }
}

struct EditProfileModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView() {
                
            VStack {
                Text("Edit profile")
                
                // Navigation bar
                .navigationBarTitle(Text("Edit profile"), displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        // Action
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        // Design
                        Text("Cancel")
                    }
                                    ,trailing:
                    Button(action: {
                        // Action
                        // Have to save expense before dismiss view
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        // Design
                        Text("Save")
                        .bold()
                    }
                )
                
        }
    }
}
}*/
