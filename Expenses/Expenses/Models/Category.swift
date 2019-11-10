//
//  Category.swift
//  Expenses
//
//  Created by Amory Rouault on 10/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import Foundation

class Category : Identifiable{
    var id = UUID()
    var title: String = ""
    var amount: Int = 0
    
    init(title: String, amount: Int) {
        self.title = title
        self.amount = amount
    }
}
