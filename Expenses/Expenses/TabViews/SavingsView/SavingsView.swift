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
            
            ZStack {
                
                VStack {
                    Rectangle()
                        .frame(height: 175, alignment: .center)
                        .foregroundColor(Color.init("Header Detail"))
                    
                    Spacer()
                }
                
                VStack {
                    
                    HStack {
                        
                        Text("Resume")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.top)
                        
                        Spacer()
                        
                    }.padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 15) {
                            ResumeView(title: "Savings", amount: "$\(self.computeSavings())")
                            ResumeView(title: "Expenses", amount: "$\(self.expensesHandler.totalExpenses())")
                            ResumeView(title: "Revenue", amount: "$\(self.profileHandler.profile.revenue)")
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                    }.padding(.bottom)
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Categories")
                                .bold()
                                .padding(.top)
                            
                            Spacer()
                            
                        }.padding(.leading)
                        
                        List {
                            
                            ForEach(CategoryHandler.getCategoriesFromAllExpenses(expenses: expensesHandler.expenses)) { category in
                                CategoryRow(category: category)
                            }
                            
                        }
                        
                    }
                    .frame(width: 343)
                    .background(Color.init("Appearance"))
                    .cornerRadius(8)
                    .shadow(/*color: Color.init("Shadow"),*/ radius: 6)
                    
                    Spacer()
                    
                }.padding(.bottom)
                
            }
            .navigationBarTitle(Text("Savings"))
            
        }
         
    }
    
    private func computeSavings() -> Int {
        if self.profileHandler.profile.revenue.isEmpty {
            return 0
        }
        return Int(self.profileHandler.profile.revenue)! - self.expensesHandler.totalExpenses()
    }
}

struct SavingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsView()
            .environmentObject(ExpensesHandler())
            .environmentObject(ProfileHandler())
        
    }
}
