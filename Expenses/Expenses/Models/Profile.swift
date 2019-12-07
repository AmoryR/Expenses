//
//  Profile.swift
//  Expenses
//
//  Created by Amory Rouault on 31/10/2019.
//  Copyright © 2019 Amory Rouault. All rights reserved.
//

import Combine
import SwiftUI

struct Profile: Codable {
    var profileImageUrl: String // Should be an UIImage so that picker can give an image
    var name: String
    var age: String // Should be Int but problem with text field
    var work: String
    var revenue: String // Should be Int but problem with text field
}

class ProfileHandler: ObservableObject {
    @Published var profile = Profile(profileImageUrl: "", name: "", age: "", work: "", revenue: "") {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(profile) {
                UserDefaults.standard.set(encoded, forKey: "Profile")
            }
        }
    }
    
    init() {
        if let profile = UserDefaults.standard.data(forKey: "Profile") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode(Profile.self, from: profile) {
                self.profile = decoded
                return
            }
        }
        
        self.profile = Profile(profileImageUrl: "", name: "", age: "", work: "", revenue: "")
    }
}

