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
            
        HStack {
            // Main image
            Image(self.expense.category.lowercased())
                .resizable()
                .frame(width: 38, height: 38)
                .cornerRadius(8)
            
            // Main informations
            VStack(alignment: .leading) {
                Text(self.expense.title)
                Text(self.expense.category)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            // Amount
            Text(String(format: "$%.2f", expense.amount))
                .foregroundColor(.green)
            
        }.padding(5)
    }
}

struct ExpensesRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesRow(expense: Expense(title: "Netflix", amount: 15, category: "Subscription"))
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
