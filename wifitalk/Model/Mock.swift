//
//  MockModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

struct Mock {
    static let wifiStates = [
        WifiState(connected: true, wifi: Wifi(name: "test name 1", ssid: "test ssid 1")),
        WifiState(connected: true, wifi: Wifi(name: "test name 2", ssid: "test ssid 2")),
        WifiState(connected: false, wifi: nil),
    ]
    
    static let user = User(name: "test user", profileImage: "G1293829382")
    
    static var binaryProfile: BinaryProfile {
        BinaryProfileGenerator().generate49()
    }
}
