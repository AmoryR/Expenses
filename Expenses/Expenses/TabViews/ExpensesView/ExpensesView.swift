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
    @State private var showAddExpense = false
    @State private var showAlertExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expensesHandler.expenses) { expense in
                    NavigationLink(destination: ExpensesDetail(expense: expense)) {
                        ExpensesRow(expense: expense)
                    }
                }
                .onDelete(perform: deleteExpense)
            }
            .navigationBarTitle(Text("Expenses"))
            .accentColor(.green)
            .navigationBarItems(trailing:
                Button(action: {
                    
                    if self.expensesHandler.expenses.count < 100 {
                        self.showAddExpense = true
                    } else {
                        self.showAlertExpense = true
                    }
                    
                }) {
                    Image(systemName: "plus")
                }
                .alert(isPresented: self.$showAlertExpense) {
                    Alert(title: Text("Expenses capacity reached"),
                          message: Text("You cannot add more than 100 expenses"),
                          dismissButton: .default(Text("Dismiss")))
                }
                .sheet(isPresented: self.$showAddExpense) {
                    NewExpenseView(mode: .new).environmentObject(self.expensesHandler) }
            )
            
        }
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expensesHandler.expenses.remove(atOffsets: offsets)
    }
}

#if DEBUG
struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExpensesView()
        }
    }
}
#endif
