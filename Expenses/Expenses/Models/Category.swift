//
//  Category.swift
//  Expenses
//
//  Created by Amory Rouault on 10/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import Foundation

class CategoryHandler {
    
    static func getCategoriesFromAllExpenses(expenses: [Expense]) -> [Category] {
        
        var categories: [Category] = []
        var titles: [String] = []
        
        // Get all category names
        for expense in expenses {
            if !titles.contains(expense.category) {
                titles.append(expense.category)
            }
        }
        
        // Create category from names
        for title in titles {
            let filteredExpenses = expenses.filter { $0.category == title }
            let category = Category(expenses: filteredExpenses)
            category.title = filteredExpenses[0].category
            
            for expense in filteredExpenses {
                category.amount += expense.amount
            }
            
            categories.append(category)
        }
        
        return categories
    }
    
}

class Category : Identifiable {
    var id = UUID()
    var title: String
    var amount: Float
    var expenses: [Expense] = []
    
    init(expenses: [Expense]) {
        self.title = ""
        self.amount = 0.0
        self.expenses = expenses
    }
}
