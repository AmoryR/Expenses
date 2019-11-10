//
//  CategoryRow.swift
//  Expenses
//
//  Created by Amory Rouault on 10/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var category: Category
    
    var body: some View {
        NavigationLink(destination: Text("Category detail")) {
            
            HStack {
                
                Image(category.title.lowercased())
                    .resizable()
                    .frame(width: 38, height: 38)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(category.title)
                        .foregroundColor(Color.black)
                    Text("$\(category.amount)")
                        .foregroundColor(Color.green)
                }
                
                Spacer()
                
            }
            
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: Category(title: "Bank", amount: 0))
    }
}