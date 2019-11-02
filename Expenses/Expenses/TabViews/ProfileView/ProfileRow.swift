//
//  ProfileRow.swift
//  Expenses
//
//  Created by Amory Rouault on 27/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import SwiftUI

struct ProfileInformation {
    var title: String
    var value: String
}


struct ProfileRow: View {
    
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            // Title
            Text(title)
            
            // Spacer
            Spacer()
            
            // Information
            Text(value)
                .foregroundColor(.gray)
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(title: "title", value: "value")
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
