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
            // Image
            
            // Title
            Text(expense.title)
            
            // Spacer
            Spacer()
            
            // Amount
            Text("$\(expense.amount)")
                .foregroundColor(.gray)
        }
    }
}

/*struct ExpensesRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesRow(expense: expensesTestData[0])
            .previewLayout(.fixed(width: 350, height: 70))
    }
}*/
