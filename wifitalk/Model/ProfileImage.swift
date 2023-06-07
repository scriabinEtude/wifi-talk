//
//  ProfileImage.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

struct ProfileImage {
    let source: String
    var isBinaryProfile: Bool
    var binaryProfile: BinaryProfile?
    
    init(source: String) {
        self.source = source
        self.isBinaryProfile = BinaryProfileGenerator.isBinaryProfile(source)
        if self.isBinaryProfile {
            self.binaryProfile = BinaryProfile(source: source)
        }
    }
    
    init(binaryProfile: BinaryProfile) {
        self.source = binaryProfile.source
        self.isBinaryProfile = true
        self.binaryProfile = binaryProfile
    }
}
