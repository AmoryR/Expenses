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
                    
                    Text("Resume")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ResumeView(title: "Savings", amount: "$")
                            ResumeView(title: "Expenses", amount: "$")
                            ResumeView(title: "Revenue", amount: "$")
                        }.padding(.leading)
                    }.padding(.bottom)
                    
                    VStack {
                        
                        Text("Categories")
                            .bold()
                            .padding(.top)
                        
                        List {
                            
                            ForEach(CategoryHandler.getCategoriesFromAllExpenses(expenses: expensesHandler.expenses)) { category in
                                CategoryRow(category: category)
                            }
                            
                        }
                        
                    }
                    .frame(width: 343)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 6)
                    
                    Spacer()
                    
                }
                
            }
            .navigationBarTitle(Text("Savings"))
            
        }
        
        /*NavigationView {
        
            VStack {
                
                // Resume
                VStack(alignment: .leading) {
                    Text("Resume")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            VStack(alignment: .leading) {
                                Text("Savings")
                                    .foregroundColor(.primary)
                                    .font(.caption)
                                Text("Amount")
                                    .foregroundColor(.primary)
                                    .font(.caption)
                            }
                            .padding(.leading, 15)
                        }
                    }
                }
                
                // Resume
                HStack {
                    Text("Resume")
                        .bold()
                    Spacer()
                }.padding(.leading, 12)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ResumeView(title: "Savings",
                                   amount: "$\(self.computeSavings())")
                        ResumeView(title: "Revenue",
                                   amount: "$\(self.profileHandler.profile.revenue)")
                        ResumeView(title: "Expenses",
                                   amount: "$\(self.expensesHandler.totalExpenses())")
                    }
                    .padding(12)
                }
                
                Divider()
                
                // Categories
                HStack {
                    Text("Categories")
                        .bold()
                    Spacer()
                }.padding(.leading, 12)
                
                List {
                    ForEach(self.expensesHandler.getCategories()) { category in
                        CategoryRow(category: category)
                        
                    }
                }
                
            }.navigationBarTitle(Text("Savings"))
        }*/
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
