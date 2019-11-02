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
    
    @Binding var expensesHandler: ExpensesHandler
    
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var typeSelected = 0
    @State private var categorySelected = 0
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    // Expense title
                    TextField("Title", text: $title)
                    
                    // Expense amount
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    // Type
                    Picker(selection: $typeSelected, label: Text("Type")) {
                       ForEach(0 ..< ExpenseType.count) {
                          Text(ExpenseType[$0])
                       }
                    }
                    
                    // Category
                    Picker(selection: $categorySelected, label: Text("Category")) {
                        ForEach(0 ..< ExpenseCategory.count) {
                           Text(ExpenseCategory[$0])
                        }
                     }
                }
                
            }
            .navigationBarTitle(Text("New expense"), displayMode: .inline)
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
                    let newExpense = Expense(title: self.title,
                                             amount: Int(self.amount)!,
                                             type: ExpenseType[self.typeSelected],
                                             category: ExpenseCategory[self.categorySelected])
                    self.expensesHandler.expenses.append(newExpense)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    // Design
                    Text("Add")
                    .bold()
                }.disabled(!formIsValid())
            )
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
