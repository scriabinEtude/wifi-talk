//
//  ProfileImageGenerator.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

struct BinaryProfileGenerator {
    private static let prefix = "G"
    
    static func generate49() -> BinaryProfile {
        return BinaryProfile(
            source:
                Self.prefix + self.getRGB() + self.getDigits(7)
        )
    }
    
    static private func getRGB() -> String {
        return Int.random(in: (0...255)).description.leftPadding(toLength: 3, withPad: "0")
        + Int.random(in: (0...255)).description.leftPadding(toLength: 3, withPad: "0")
        + Int.random(in: (0...255)).description.leftPadding(toLength: 3, withPad: "0")
    }
    
    static private func getDigits(_ odd: Int) -> String {
        assert(odd % 2 == 1, "parameter odd should be odd number")
        var columns = [String]()
        let even = (odd - 1) / 2
        
        for _ in 0...even {
            columns.append(self.getColumn(odd))
        }
        
        for i in (0..<even).reversed() {
            columns.append(columns[i])
        }
        
        return columns.joined(separator: "")
        
    }
    
    static private func getColumn(_ length: Int) -> String {
        return (0..<length)
            .map({ _ in String(Int.random(in: (0...1))) })
            .joined(separator: "")
    }
    
    static func isBinaryProfile(_ source: String) -> Bool {
        return source.starts(with: Self.prefix)
    }
}
