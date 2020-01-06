//
//  ExpensesDetail.swift
//  Expenses
//
//  Created by Amory Rouault on 02/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ExpensesDetail: View {
    
    @EnvironmentObject var expensesHandler: ExpensesHandler
    
    @State private var showEditExpense = false
    
    var expense: Expense
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                // Background
                Rectangle()
                    .frame(height: 160, alignment: .center)
                    .foregroundColor(Color.init("Header Detail"))
                
                VStack {
                    
                    // Expense image
                    Image(expense.category.lowercased())
                        .resizable()
                        .frame(width: 82, height: 82)
                        .cornerRadius(8)
                        .shadow(radius: 6)
                    
                    // Expense informations
                    Text(expense.title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "$%.2f", expense.amount))
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    // Expense category
                    HStack {
                        Text("Category")
                            .bold()
                        Spacer()
                        Text(expense.category)
                    }
                    .padding()
                    .frame(width: 343, height: 65, alignment: .center)
                    .background(Color.init("Appearance"))
                    .cornerRadius(8)
                    .shadow(/*color: Color.init("Shadow"),*/ radius: 6)
                }
                
            }
            
            Spacer()
            
            Button(action: {
                self.showEditExpense.toggle()
            }) {
                Text("Edit")
                    .foregroundColor(.white)
                    .frame(width: 78, height: 35, alignment: .center)
                    .background(Color.init("Header Detail"))
                    .cornerRadius(8)
            }
            .padding()
            .sheet(isPresented: self.$showEditExpense) {
                NewExpenseView(isEditMode: true, expenseId: self.expense.id).environmentObject(self.expensesHandler) }
            
            
            
        }
        
    }
}

#if DEBUG
//struct ExpensesDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpensesDetail(expense: Expense(title: "Cinema", amount: 20, category: "Entertainment"))
//    }
//}
#endif
