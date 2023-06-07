//
//  ProfileImageGenerator.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

struct BinaryProfileGenerator {
    private let prefix = "G"
    
    func generate49() -> BinaryProfile {
        return BinaryProfile(
            source:
                self.prefix + self.getRGB() + self.getDigits(7)
        )
    }
    
    private func getRGB() -> String {
        return Int.random(in: (0...255)).description.leftPadding(toLength: 3, withPad: "0")
        + Int.random(in: (0...255)).description.leftPadding(toLength: 3, withPad: "0")
        + Int.random(in: (0...255)).description.leftPadding(toLength: 3, withPad: "0")
    }
    
    private func getDigits(_ odd: Int) -> String {
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
    
    private func getColumn(_ length: Int) -> String {
        return (0..<length)
            .map({ _ in String(Int.random(in: (0...1))) })
            .joined(separator: "")
    }
}
