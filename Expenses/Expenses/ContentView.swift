//
//  ContentView.swift
//  Expenses
//
//  Created by Amory Rouault on 24/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
 
    var body: some View {
        TabView(selection: $selection){
            ExpensesView()
                .tabItem {
                    VStack {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Expenses")
                    }
                }
                .tag(0)
            SavingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "chart.pie.fill")
                        Text("Savings")
                    }
                }
                .tag(1)
            ProfileView()
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

struct ExpensesView: View {
    var body: some View {
        HStack {
            
            ExpensesList()
        }
    }
}
struct ExpensesList: View {
    
    var selection = ["Expenses", "Statistics"]
    @State private var selected = 0
    @State private var showAddExpense = false
    
    var body: some View {
        NavigationView {
            
            List {
                //ExpensesPicker()
                Picker(selection: $selected, label: Text("ExpensesPicker")) {
                   ForEach(0 ..< selection.count) {
                      Text(self.selection[$0])
                   }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if (selected == 0) {
                    ForEach(0 ..< 5) {_ in
                        ExpensesRow()
                    }
                } else {
                    
                }
            }
        .navigationBarTitle(Text("Expenses"))
        .navigationBarItems(trailing:
            Button(action: {
                // Action
                self.showAddExpense = true
            }) {
                // Design
                Image(systemName: "plus")
            }.sheet(isPresented: self.$showAddExpense) { AddExpenseModalView() }
        )
        }
    }
}

/*struct ExpensesPicker: View {
    
    @State private var selected = 0
    
    var body: some View {
        Picker(selection: $selected, label: Text("ExpensesPicker")) {
           Text("Expenses")
           Text("Statistics")
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}*/

struct ExpensesRow: View {
    var body: some View {
        HStack {
            Text("Netflix")
            
            Spacer()
            
            Text("$0")
        }
    }
}

struct AddExpenseModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var selection = ["Expenses", "Statistics"]
    @State private var selected = 0
    
    @State var expense: String = ""
    @State var amount: String = ""
    
    var categorySelection = [
        "Cable TV",
        "Internet",
        "Mobile phone",
        "Subscription",
        "Electricity",
        "Gas",
        "Insurance",
        "Rent",
        "Water",
        "Taxes",
    ]
    @State private var categorySelected = 0
    
    var body: some View {
        NavigationView() {
            //Text("Hello")
                
            VStack {
                //ExpensesPicker()
                Picker(selection: $selected, label: Text("ExpensesPicker")) {
                   ForEach(0 ..< selection.count) {
                      Text(self.selection[$0])
                   }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("Expense", text: $expense)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Amount", text: $amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Picker(selection: $categorySelected, label: Text("CategoryPicker")) {
                   ForEach(0 ..< categorySelection.count) {
                      Text(self.categorySelection[$0])
                   }
                    }.labelsHidden()
                
                Spacer()
                }.padding(8)
                
                // Navigation bar
                .navigationBarTitle(Text("Add expense"), displayMode: .inline)
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
}
