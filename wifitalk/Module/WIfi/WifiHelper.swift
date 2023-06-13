//
//  HotspotHelper.swift
//  wifitalk
//
//  Created by escher on 2023/06/05.
//

import Foundation
import NetworkExtension
import SystemConfiguration.CaptiveNetwork

import Combine

protocol WifiHelperProtocol {
    func getWifiState() -> WifiState
}

class WifiHelper: WifiHelperProtocol {
    func getWifiState() -> WifiState {
        var wifi: Wifi?
        
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    guard
                        let ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String,
                        let bssid = interfaceInfo[kCNNetworkInfoKeyBSSID as String] as? String
                    else { break }
                    
                    wifi = Wifi(ssid: ssid, bssid: bssid)
                    break
                }
            }
        }
        
        return WifiState(
            connected: wifi != nil,
            wifi: wifi
        )
    }
    
}

class WifiHelperMock: WifiHelperProtocol {
    
    func getWifiState() -> WifiState {
        
        return Mock.wifiStates[0]
//        if Calendar.current.component(.second, from: Date()) / 2 % 2 == 0 {
//            return Mock.wifiStates[0]
//        } else {
//            return Mock.wifiStates[1]
//        }
    }
    
}
