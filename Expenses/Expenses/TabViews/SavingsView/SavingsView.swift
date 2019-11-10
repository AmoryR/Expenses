//
//  SavingView.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct SavingsView: View {
    
    @EnvironmentObject var expensesHandler: ExpensesHandler
    @EnvironmentObject var profileHandler: ProfileHandler
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                // Resume
                HStack {
                    Text("Resume")
                        .bold()
                    Spacer()
                }.padding(.leading, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 24) {
                        ResumeView(title: "Savings",
                                   amount: "$\(self.computeSavings())")
                        ResumeView(title: "Revenue",
                                   amount: "$\(self.profileHandler.profile.revenue)")
                        ResumeView(title: "Expenses",
                                   amount: "$\(self.expensesHandler.totalExpenses())")
                    }
                    .padding(8)
                }
                
                Divider()
                
                // Categories
                HStack {
                    Text("Categories")
                        .bold()
                    Spacer()
                }.padding(.leading, 8)
                
                List {
                    ForEach(self.expensesHandler.getCategories()) { category in
                        CategoryRow(category: category)
                        
                    }
                }
                
            }.navigationBarTitle(Text("Savings"))
        }
    }
    
    private func computeSavings() -> Int {
        if self.profileHandler.profile.revenue.isEmpty {
            return 0
        }
        return Int(self.profileHandler.profile.revenue)! - self.expensesHandler.totalExpenses()
    }
}

/*struct SavingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsView()
    }
}*/
