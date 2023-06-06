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

protocol WifiHelper {
    func getWifiState() -> WifiState
}

class WifiHelperMock: WifiHelper {
    
    func getWifiState() -> WifiState {
        if Calendar.current.component(.second, from: Date()) / 2 % 2 == 0 {
            return WifiState(connected: true, wifi: Wifi(name: "test name 1", ssid: "test ssid 1"))
        } else {
            return WifiState(connected: true, wifi: Wifi(name: "test name 2", ssid: "test ssid 2"))
        }
        
    }
}


//protocol WifiHelper {
//    var wifiPublisher: any Publisher<WifiState, Never> { get set }
//    func getWifiState() -> WifiState
//
//}
//
//class WifiHelperManager: WifiHelper {
//    var wifiPublisher: Publisher<WifiState, Never>
//    let delegate: WifiHelperDele
//
//    func getWifiState() -> WifiState {
//
//    }
//
//
//
//    func setCurrentWifiPublisher() {
//        self.wifiPublisher = Timer
//            .publish(every: 1, on: .main, in: .common)
//            .map{ getWifiState() }
//            .autoconnect()
//    }
//}
//
//class WifiHelperMock: WifiHelper {
//    var currentWifiPublisher: any Publisher<WifiState, Never>
//
//    static let shared = WifiHelperMock()
//
//    func getWifiState() -> Wifi? {
//        return Wifi(
//            name: "testname",
//            ssid: "testssid"
//        )
//    }
//}

//struct HotspotHelperImpl {
//    static func getCurrentSSID() -> String? {
//        var ssid: String?
//        print(CNCopySupportedInterfaces() as NSArray?)
//        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
//            for interface in interfaces {
//                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
//                    print(interfaceInfo)
//                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
//                    break
//                }
//            }
//        }
//        return ssid
//    }
//}
