//
//  Expense.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import Combine
import SwiftUI

//MARK: Expense

// Should be ENUM
let ExpenseType = [
    "Fixed",
    "Variable"
]
// Should be ENUM
let ExpenseCategory = [
    "Bank",
    "Cable TV",
    "Electricity",
    "Entertainment",
    "Food",
    "Gas",
    "Insurance",
    "Internet",
    "Rent",
    "Subscription",
    "Water"
]

struct Expense : Identifiable, Codable {
    var id = UUID()
    var title: String
    var amount: Int
    var type: String
    var category: String
}

class ExpensesHandler : ObservableObject {
    @Published var expenses: [Expense] = [Expense]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(expenses) {
                UserDefaults.standard.set(encoded, forKey: "Expenses")
            }
        }
    }
    
    init() {
        if let expenses = UserDefaults.standard.data(forKey: "Expenses") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Expense].self, from: expenses) {
                self.expenses = decoded
                return
            }
        }
        
        self.expenses = []
    }
    
    func totalExpenses() -> Int {
        var sum: Int = 0
        
        for expense in self.expenses {
            sum += expense.amount
        }
        
        return sum
    }
    
    func getCategories() -> [Category] {
        
        var categories : [Category] = [Category]()
        
        /*for expense in self.expenses {
            
            // If expense.category is not in categories
            //      add it
            
            // Add expense.amount to the correct categories
            
        }*/
        
        // Create expenses
        for expense in self.expenses {
            let categoriesContainsThisExpense = categories.contains { category in
                if category.title == expense.category {
                    return true
                } else {
                    return false
                }
            }
            
            if !categoriesContainsThisExpense {
                categories.append(Category(title: expense.category, amount: 0))
            }
        }
        
        // Compute expenses amount
        for expense in self.expenses {
            categories.first(where: { $0.title == expense.category })?.amount += expense.amount
        }
        
        return categories
    }
}

