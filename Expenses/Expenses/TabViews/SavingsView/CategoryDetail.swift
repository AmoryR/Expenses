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
            
        ZStack {
            
            // Background
            Rectangle()
                .frame(height: 160, alignment: .center)
                .foregroundColor(Color.init("Header Detail"))
                .offset(y: -170)
            
            VStack {
                
                // Category image
                Image(category.title.lowercased())
                    .resizable()
                    .frame(width: 82, height: 82)
                    .cornerRadius(8)
                    .shadow(radius: 6)
                
                // Category informations
                Text(category.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("$\(category.amount)")
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                // Expenses list
                VStack {
                    
                    HStack {
                        
                        Text("Expenses")
                            .bold()
                        
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.leading)
                    
                    List {
                        
                        ForEach(category.expenses) { expense in
                            ExpensesRow(expense: expense)
                        }
                    }
                    
                }
                .frame(width: 343)
                .background(Color.init("Appearance"))
                .cornerRadius(8)
                .shadow(radius: 6)
            }
            .padding(.bottom)
            
        }
        
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetail(category: Category(expenses: []))
    }
}
