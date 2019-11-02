//
//  ExpensesView.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

// TEST FOR DEBUG
struct Weather: Identifiable {
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}

let modelData: [Weather] = [
Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
Weather(image: "sun.max", temp: 25, city: "Paris"),
Weather(image: "cloud.sun", temp: 23, city: "Tokyo")]

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
                ForEach(expensesHandler.expenses.filter { $0.type == self.expensesSelection[self.expensesSelected] }) { expense in
                    ExpensesRow(expense: expense)
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
