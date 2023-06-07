//
//  IntUtil.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

extension Int {
    func sqrt() -> Double {
        return Double(self).squareRoot()
    }
    
    func double() -> Double {
        return Double(self)
    }
    
    func rgbRatio() -> Double {
        return (Double(self) / 255.0)
    }
}
