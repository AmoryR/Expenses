//
//  NewExpenseView.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct NewExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var expensesHandler: ExpensesHandler
    
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var categorySelected = 0
    
    // Edit mode variable
    @State var expense: Expense?
    var isEditMode = false
    var expenseId = UUID()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("INFORMATIONS")) {
                    // Expense title
                    HStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Text("Title")
                                .foregroundColor(.blue)
                            
                        }.frame(width: 70)
                            
                        TextField("Title", text: $title)
                    }
                    
                    // Expense amount
                    HStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Text("Amount")
                                .foregroundColor(.blue)
                            
                        }.frame(width: 70)
                        
                        TextField("Amount", text: $amount)
                            .keyboardType(.numberPad)
                    }
                    
                }
                
                Section(header: Text("CATEGORY")) {
                    // Category
                    Picker(selection: $categorySelected, label: Text("Category")) {
                        ForEach(0 ..< ExpenseCategory.count) {
                           Text(ExpenseCategory[$0])
                        }
                     }
                }
                
            }
            .navigationBarTitle(!self.isEditMode ? Text("New expense") : Text("Edit expense"), displayMode: .inline)
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
                    
                    // NEW
                    if !self.isEditMode {
                        if self.expensesHandler.expenses.count < 100 { // Just for security
                            let titleTrim = self.title.trimmingCharacters(in: .whitespaces)
                            
                            let newExpense = Expense(title: titleTrim,
                                                     amount: Int(self.amount)!,
                                                     category: ExpenseCategory[self.categorySelected])
                            self.expensesHandler.expenses.append(newExpense)
                            
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }
                    }
                    // EDIT
                    else {
                        
                        // modify expense from list
                        let titleTrim = self.title.trimmingCharacters(in: .whitespaces)
                        
                        self.expense?.title = titleTrim
                        self.expense?.amount = Int(self.amount)!
                        self.expense?.category = ExpenseCategory[self.categorySelected]
                        
                        // Find a way to modify self.expensesHandler.expenses
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                        
                    }
                    
                }) {
                    // Design
                    
                    // NEW
                    if !self.isEditMode {
                        Text("Add").bold()
                    }
                    // EDIT
                    else {
                        Text("Modify").bold()
                    }
                    
                }.disabled(!formIsValid())
            )
        }
        .onAppear {
            if self.isEditMode {
                
                self.expense = self.expensesHandler.expenses.filter { $0.id == self.expenseId }.first
                
                self.title = self.expense!.title
                self.amount = String(self.expense!.amount)
                self.categorySelected = ExpenseCategory.firstIndex(of: self.expense!.category)!
            }
        }
        
    }
    
    private func formIsValid() -> Bool {
        
        if title.isEmpty {
            return false
        }
        
        if amount.isEmpty {
            return false
        }
        
        return true
    }
}

/*struct NewExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExpenseView(expenses: expensesTestData)
    }
}*/
