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
                ForEach(self.expensesHandler.expenses) { expense in
                    NavigationLink(destination:
                        
                        ExpensesDetail(expense: expense).environmentObject(self.expensesHandler)
                    
                    ) {
//                        Expense Row view is not refresh with expense edition
//                        ExpensesRow(expense: expense)
                        
                        // This is from Expense Row but this way it works
                        // ============================================
                        HStack {
                            // Main image
                            Image(expense.category.lowercased())
                                .resizable()
                                .frame(width: 38, height: 38)
                                .cornerRadius(8)
                            
                            // Main informations
                            VStack(alignment: .leading) {
                                Text(expense.title)
                                Text(expense.category)
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                            
                            Spacer()
                            
                            // Amount
                            Text("$\(expense.amount)")
                                .foregroundColor(.green)
                            
                        }.padding(5)
                        // ============================================
                        
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
                    NewExpenseView().environmentObject(self.expensesHandler) }
            )
            
        }
    }
    
    func deleteExpense(at offsets: IndexSet) {
        self.expensesHandler.remove(atOffsets: offsets)
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
