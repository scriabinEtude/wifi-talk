//
//  WifiViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/06.
//

import SwiftUI
import Combine

class WifiViewModel: ObservableObject {
    @Published var isWifiStateChanged: Bool
    var wifiState: WifiState
    let wifiHelper: WifiHelper
    var wifiPublisherCancellable: AnyCancellable?
    
    init(wifiHelper: WifiHelper) {
        self.wifiState = WifiState(connected: false, wifi: nil)
        self.isWifiStateChanged = false
        self.wifiHelper = wifiHelper
        setWifiStatePublisher()
    }
    
    func setWifiStatePublisher() {
        wifiPublisherCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                let wifiState = self.wifiHelper.getWifiState()
                self.isWifiStateChanged = self.wifiState == wifiState
                self.wifiState = wifiState
                print(self.wifiState)
                print(self.isWifiStateChanged)
            }
    }
        
}
