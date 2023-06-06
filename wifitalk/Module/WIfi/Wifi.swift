//
//  Wifi.swift
//  wifitalk
//
//  Created by escher on 2023/06/06.
//

import Foundation

struct Wifi: Equatable {
    let name: String
    let ssid: String
    
    init(name: String, ssid: String) {
        self.name = name
        self.ssid = ssid
    }
    
    static func == (lhs: Wifi, rhs: Wifi) -> Bool {
        return lhs.ssid == rhs.ssid
    }
}
