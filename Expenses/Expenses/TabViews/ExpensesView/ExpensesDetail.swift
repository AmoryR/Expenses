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
            
            Rectangle()
                .frame(height: 255, alignment: .center)
                .foregroundColor(Color.init("Header Detail"))
            
            HStack(alignment: .bottom) {
                
                Image(expense.category.lowercased())
                    .resizable()
                    .frame(width: 82, height: 82)
                    .cornerRadius(8)
                    .shadow(radius: 6)
                
                VStack(alignment: .leading) {
                    
                    Text(expense.title)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("$\(expense.amount)")
                        .foregroundColor(.white)
                    
                }.padding(.leading)
                
            }.offset(x: -60, y: -155) // Problem with x : -60
            
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
            .offset(y: -135)
            
            Spacer()
            
            Button(action: {}) {
                Text("Edit")
                    .foregroundColor(.white)
                    .frame(width: 78, height: 35, alignment: .center)
                    .background(Color.init("Header Detail"))
                    .cornerRadius(8)
            }.padding()
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

#if DEBUG
struct ExpensesDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExpensesDetail(expense: Expense(title: "Cinema", amount: 20, category: "Entertainment"))
        }
    }
}
#endif
