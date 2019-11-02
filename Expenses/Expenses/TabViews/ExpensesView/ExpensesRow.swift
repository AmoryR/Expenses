//
//  ExpensesRow.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ExpensesRow: View {
    var expense: Expense
    
    var body: some View {
        NavigationLink(destination: ExpensesDetail(expense: self.expense)) {
            HStack {
                
                VStack(alignment: .leading) {
                    // Title
                    Text(expense.title)
                    
                    // Category
                    Text(expense.category)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                
                // Spacer
                Spacer()
                
                // Amount
                Text("$\(expense.amount)")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ExpensesRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesRow(expense: Expense(title: "Netflix", amount: 15, type: "Fixed", category: "Subscription"))
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
