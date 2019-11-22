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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expensesHandler.expenses) { expense in
                    ExpensesRow(expense: expense)
                }
                .onDelete(perform: deleteExpense)
            }
            .navigationBarTitle(Text("Expenses"))
            .navigationBarItems(trailing:
                Button(action: { self.showAddExpense = true }) {
                    Image(systemName: "plus")
                }.sheet(isPresented: self.$showAddExpense) { NewExpenseView().environmentObject(self.expensesHandler) }
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
