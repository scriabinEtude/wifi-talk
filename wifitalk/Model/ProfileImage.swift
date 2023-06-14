//
//  ProfileImage.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

enum ProfileImageType {
    case binary, base64, network
    
    static func getType(_ source: String) -> ProfileImageType {
        if BinaryProfileGenerator.isBinaryProfile(source) {
            return .binary
        } else if source.starts(with: "http") {
            return .network
        } else {
            return .base64
        }
    }
}

struct ProfileImage {
    let source: String
    var type: ProfileImageType
    
    init(source: String) {
        self.source = source
        self.type = ProfileImageType.getType(source)
    }
}
