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
        
        ZStack {
            Image("expense-detail")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
            
            HStack {
                
                VStack(alignment: .leading) {
                    Image(expense.category.lowercased())
                        .resizable()
                        .frame(width: 94, height: 94)
                        .cornerRadius(8)
                    
                    Text(expense.title)
                        .font(.title)
                    Text(expense.category)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("$\(expense.amount)")
                        .font(.body)
                        .foregroundColor(Color.green)
                }
                Spacer()
                
            }.padding(16)
        }
    
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
