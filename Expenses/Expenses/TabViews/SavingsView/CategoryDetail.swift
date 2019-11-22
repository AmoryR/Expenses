//
//  CategoryDetail.swift
//  Expenses
//
//  Created by Amory Rouault on 10/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct CategoryDetail: View {
    
    var category: Category
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(height: 255, alignment: .center)
                .foregroundColor(Color.init("Header Detail"))
            
            HStack(alignment: .bottom) {
                
                Image(category.title.lowercased())
                    .resizable()
                    .frame(width: 82, height: 82)
                    .cornerRadius(8)
                    .shadow(radius: 6)
                
                VStack(alignment: .leading) {
                    
                    Text(category.title)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("$\(category.amount)")
                        .foregroundColor(.white)
                    
                }.padding(.leading)
                
            }.offset(x: -60, y: -155) // Problem with x : -60
            
            VStack {
                
                Text("Categories")
                    .bold()
                    .padding(.top)
                
                List {
                    
                    ForEach(category.expenses) { expense in
                        ExpensesRow(expense: expense)
                    }
                }
                
            }
            .frame(width: 343)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 6)
            .offset(y: -135)
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetail(category: Category(expenses: []))
    }
}
