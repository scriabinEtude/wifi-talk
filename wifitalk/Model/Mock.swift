//
//  MockModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import Foundation

struct Mock {
    static let wifiStates = [
        WifiState(connected: true, wifi: Wifi(ssid: "test name 1", bssid: "test bssid 1")),
        WifiState(connected: true, wifi: Wifi(ssid: "test name 2", bssid: "test bssid 2")),
        WifiState(connected: false, wifi: nil),
    ]
}
