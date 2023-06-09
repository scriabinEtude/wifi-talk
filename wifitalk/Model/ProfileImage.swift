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
    
    init(source: String) {
        self.source = source
        self.isBinaryProfile = BinaryProfileGenerator.isBinaryProfile(source)
    }
}
