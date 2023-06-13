//
//  Wifi.swift
//  wifitalk
//
//  Created by escher on 2023/06/06.
//

import Foundation

struct Wifi: Equatable, Identifiable {
    var id = UUID()
    
    let ssid: String
    let bssid: String
    
    init(ssid: String, bssid: String) {
        self.ssid = ssid
        self.bssid = bssid
    }
    
    init(_ wifiHistory: WifiHistory) {
        self.ssid = wifiHistory.ssid!
        self.bssid = wifiHistory.bssid!
    }
    
    static func == (lhs: Wifi, rhs: Wifi) -> Bool {
        return lhs.ssid == rhs.ssid && lhs.bssid == rhs.bssid
    }
    
    static func != (lhs: Wifi, rhs: Wifi) -> Bool {
        return !(lhs == rhs)
    }
}
