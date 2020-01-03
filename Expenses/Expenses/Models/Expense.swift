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

class Expense : Identifiable, Codable {
    var id = UUID()
    var title: String
    var amount: Int
    var category: String
    
    init(title: String, amount: Int, category: String) {
        self.title = title
        self.amount = amount
        self.category = category
    }
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
    
    func add(newExpense: Expense) {
        self.expenses.append(newExpense)
    }
    
    func replace(atIndex index: Int, expense: Expense) {
        self.expenses[index] = expense
    }
    
    func remove(atOffsets offset: IndexSet) {
        self.expenses.remove(atOffsets: offset)
    }
    
    func totalExpenses() -> Int {
        var sum: Int = 0
        
        for expense in self.expenses {
            sum += expense.amount
        }
        
        return sum
    }
    
}

