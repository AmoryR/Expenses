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
                    Text("$\(expense.amount)")
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
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)
                }
                
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("Edit")
                    .foregroundColor(.white)
                    .frame(width: 78, height: 35, alignment: .center)
                    .background(Color.init("Header Detail"))
                    .cornerRadius(8)
            }.padding()
            
        }
        
    }
}

#if DEBUG
struct ExpensesDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesDetail(expense: Expense(title: "Cinema", amount: 20, category: "Entertainment"))
    }
}
#endif
