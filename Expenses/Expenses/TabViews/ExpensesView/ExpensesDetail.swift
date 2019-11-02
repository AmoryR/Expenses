//
//  ExpensesDetail.swift
//  Expenses
//
//  Created by Amory Rouault on 02/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

//MARK: Expenses detail
struct ExpensesDetail: View {
    var expense: Expense
    
    var body: some View {
        
        List {
            ExpensesDetailRow(title: "Amount", detail: "$" + String(self.expense.amount))
            ExpensesDetailRow(title: "Type", detail: self.expense.type)
            ExpensesDetailRow(title: "Category", detail: self.expense.category)
        }.navigationBarTitle(Text(self.expense.title))
    
    }
}

//MARK: Expenses detail row
struct ExpensesDetailRow: View {
    var title: String
    var detail: String
    
    var body: some View {
        
        HStack {
            Text(title)
            
            Spacer()
            
            Text(detail)
                .foregroundColor(Color.gray)
            
        }
    
    }
}

struct ExpensesDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExpensesDetail(expense: Expense(title: "Netflix", amount: 15, type: "Fixed", category: "Subscription"))
        }
    }
}
