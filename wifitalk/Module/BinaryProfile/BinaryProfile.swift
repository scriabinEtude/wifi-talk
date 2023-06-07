//
//  ProfileImage.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

struct BinaryProfile {
    let source: String
    let r, g, b: Int
    let binary: [Bool]
    let edgeSize: Int
    
    init(source: String) {
        self.source = source
        self.r = source.substring(1, 3).toInt()
        self.g = source.substring(4, 6).toInt()
        self.b = source.substring(7, 9).toInt()
        self.binary = source
            .substring(start: 10)
            .map({ $0 == "1" ? true : false })
        self.edgeSize = self.binary.count.sqrt().int()
    }
}
