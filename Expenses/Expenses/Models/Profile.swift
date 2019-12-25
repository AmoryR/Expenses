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
    var name: String
    var age: String // Should be Int but problem with text field
    var work: String
    var revenue: String // Should be Int but problem with text field
}

class ProfileHandler: ObservableObject {
    @Published var profileImage = UIImage(named: "img-profile-default") {
        didSet {
            
            if let pngData = profileImage?.pngData() {
                UserDefaults.standard.set(pngData, forKey: "ProfilePicture")
            }
            
        }
    }
    
    @Published var profile = Profile(name: "None", age: "0", work: "None", revenue: "0") {
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
//                return
            }
        }
        
        if let imageData = UserDefaults.standard.object(forKey: "ProfilePicture") as? Data {
            self.profileImage = UIImage(data: imageData)
        }
    }
}

