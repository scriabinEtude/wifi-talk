//
//  StringUtil.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

extension String {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let stringLength = self.count
        if stringLength < toLength {
            return String(repeatElement(character, count: toLength - stringLength)) + self
        } else {
            return String(self.suffix(toLength))
        }
    }
    
    func substring(_ start: Int, _ end: Int) -> String {
        return String(self[String.Index(utf16Offset: start, in: self)...String.Index(utf16Offset: end, in: self)])
    }
    
    func substring(start: Int) -> String {
        return String(self[String.Index(utf16Offset: start, in: self)...])
    }
    
    func toInt() -> Int {
        return Int(self)!
    }
}
