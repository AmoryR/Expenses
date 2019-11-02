//
//  ExpensesView.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ExpensesView: View {
    
    @EnvironmentObject var expensesHandler: ExpensesHandler
    
    //@State var expensesHandler: ExpensesHandler = ExpensesHandler()
    @State private var showAddExpense = false
    @State private var expensesSelected = 0
    
    var expensesSelection = ["Fixed", "Variable"]
    
    var body: some View {
        NavigationView {
            List {
                
                // Picker
                Picker(selection: $expensesSelected, label: Text("ExpensesPicker")) {
                   ForEach(0 ..< expensesSelection.count) {
                      Text(self.expensesSelection[$0])
                   }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // List
                //TODO: Filter expense {fixed, variable}
                ForEach(self.expensesHandler.expenses) { expense in
                    NavigationLink(destination: ExpensesDetail(expense: expense)) {
                        ExpensesRow(expense: expense)
                    }
                    
                    /*if self.expensesSelected == 0 {
                        ExpensesRow(expense: expense)
                    } else if self.expensesSelected == 1 {
                        //ExpensesRow(expense: expense)
                    }*/
                }
                .onDelete(perform: deleteExpense)
                
            }
            .navigationBarTitle(Text("Expenses"))
            .navigationBarItems(trailing:
                Button(action: {
                    // Action
                    self.showAddExpense = true
                }) {
                    // Design
                    Image(systemName: "plus")
                }.sheet(isPresented: self.$showAddExpense) { NewExpenseView().environmentObject(self.expensesHandler) }
            )
        }
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expensesHandler.expenses.remove(atOffsets: offsets)
        //TODO: View do not refresh
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
