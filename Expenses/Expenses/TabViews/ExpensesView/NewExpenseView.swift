//
//  NewExpenseView.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

enum Mode {
    case new
    case edit
}

struct NewExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var expensesHandler: ExpensesHandler
    
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var categorySelected = 0
    
    var mode: Mode
    
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
                    
                    if self.expensesHandler.expenses.count < 100 && self.mode == .new {
                        let titleTrim = self.title.trimmingCharacters(in: .whitespaces)
                        
                        let newExpense = Expense(title: titleTrim,
                                                 amount: Int(self.amount)!,
                                                 category: ExpenseCategory[self.categorySelected])
                        self.expensesHandler.expenses.append(newExpense)
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } else if self.mode == .edit {
                        print("edit mode")
                    }
                    
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
