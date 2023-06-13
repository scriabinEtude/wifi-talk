//
//  WifiViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/06.
//

import SwiftUI
import Combine
import CoreLocation

class WifiViewModel: ObservableObject {
    
    typealias Output = Publishers.Autoconnect<Timer.TimerPublisher>.Output
    
    // MARK: - Properties
    
    // wifi
    @Published var wifiState: WifiState
    @Published var wifiHistory = [WifiHistory]()
    var isWifiStateChanged: Bool
    let wifiHelper: WifiHelper
    var wifiPublisherCancellable: AnyCancellable?
    
    // permission
    let locationPermission: LocationPermission
    @Published var isLocationPermission: Bool = false
    
    // history
    private let historyController = DataManager.shared.wifiHistory
    
    init(wifiHelper: WifiHelper) {
        self.wifiState = WifiState(connected: false, wifi: nil)
        self.isWifiStateChanged = false
        self.wifiHelper = wifiHelper
        self.locationPermission = LocationPermission()
        start()
    }
    
    func start() {
        self.locationPermission.requestAuthorization(always: true)
        setWifiStatePublisher()
        getWifiHistories()
    }
    
    func requestLocationPermissionFromSetting() {
        self.locationPermission.requestAuthorizationFromSettingScreen()
    }
    
    func getWifiHistories() {
        wifiHistory = self.historyController.fetch()
    }
    
    func updateWifiHistory(_ wifi: Wifi) {
        self.wifiHistory = self.historyController.update(wifi)
    }
    
    private func setWifiStatePublisher() {
        wifiPublisherCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: setWifiState)
    }
    
    private func setWifiState(receiveValue: Output) {
        if self.isLocationPermission {
            let wifiState = self.wifiHelper.getWifiState()
            self.isWifiStateChanged = self.wifiState != wifiState
            self.wifiState = wifiState
        } else {
            self.isLocationPermission = self.locationPermission.isAuthorised
        }
    }
        
}
