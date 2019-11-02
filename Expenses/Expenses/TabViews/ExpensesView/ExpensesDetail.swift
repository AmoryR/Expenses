//
//  ExpensesDetail.swift
//  Expenses
//
//  Created by Amory Rouault on 02/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ExpensesDetail: View {
    var expense: Expense
    
    var body: some View {
        
        //NavigationView {
            VStack {
                Text(self.expense.title)
                Text(String(self.expense.amount))
                Text(self.expense.type)
                Text(self.expense.category)
            }
            //.navigationBarTitle(Text(self.expense.title)/*, displayMode: .inline*/)
        //}
        
    }
}

struct ExpensesDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesDetail(expense: Expense(title: "A", amount: 1, type: "B", category: "C"))
    }
}
