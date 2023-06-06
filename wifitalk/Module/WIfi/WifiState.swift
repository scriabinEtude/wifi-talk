//
//  WifiState.swift
//  wifitalk
//
//  Created by escher on 2023/06/06.
//

import Foundation

struct WifiState: Equatable {
    let connected: Bool
    let wifi: Wifi?
    
    init(connected: Bool, wifi: Wifi?) {
        self.connected = connected
        self.wifi = wifi
    }
    
    static func == (lhs: WifiState, rhs: WifiState) -> Bool {
        return lhs.connected == rhs.connected
        && lhs.wifi == lhs.wifi
    }
}
