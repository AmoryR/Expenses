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
    "No category",
    "Cable TV",
    "Internet",
    "Mobile phone",
    "Subscription",
    "Electricity",
    "Gas",
    "Insurance",
    "Rent",
    "Water",
    "Taxes"
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
}

