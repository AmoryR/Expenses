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
                
                // Main card
                VStack {
                    Group {

                        Text("TOTAL EXPENSES: $\(self.expensesHandler.totalExpenses())")
                            .bold()
                        Text("REVENUE: $\(profileHandler.profile.revenue)")
                        
                    }
                }
                .frame(width: 250, height: 75, alignment: .center)
                .background(Color.white)
                .cornerRadius(8)
                .clipped()
                .shadow(color: .gray, radius: 2, x: 0, y: 1)
                
                Spacer()
                
                Text("SAVINGS: $\(self.computeSavings())")
                    .bold()
            }
            .padding(12)
            .navigationBarTitle(Text("Savings"))
        }
    }
    
    private func computeSavings() -> Int {
        return Int(self.profileHandler.profile.revenue)! - self.expensesHandler.totalExpenses()
    }
}

/*struct SavingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsView()
    }
}*/
