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

                        Text("TOTAL EXPENSES: $0")
                            .bold()
                        Text("REVENUE: $" + String(profileHandler.profile.revenue))
                        
                    }
                }
                .frame(width: 250, height: 75, alignment: .center)
                .background(Color.white)
                .cornerRadius(8)
                .clipped()
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                
                Spacer()
                
                Text("SAVINGS: $0")
                    .bold()
            }
            .navigationBarTitle(Text("Savings"))
        }
    }
}

/*struct SavingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsView()
    }
}*/
