//
//  ResumeView.swift
//  Expenses
//
//  Created by Amory Rouault on 09/11/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ResumeView: View {
    
    var title: String
    var amount: String
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(self.title)
                    .foregroundColor(.gray)
                Text(self.amount)
            }
            
            
            Spacer()
            
        }
        .padding(15)
        .frame(width: 148, height: 68)
        .background(Color.white)
        .cornerRadius(8)
            
        .clipped()
        .shadow(radius: 3)
        
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView(title: "Savings", amount: "$2000")
    }
}
