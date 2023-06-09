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
    private var wifiRefreshTime = 0.2
    
    // permission
    let locationPermission: LocationPermission
//    @Published var isLocationPermission: Bool = false
    
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
            .publish(every: wifiRefreshTime, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: setWifiState)
    }
    
    private func setWifiState(receiveValue: Output) {
        if self.locationPermission.isAuthorised {
            let wifiState = self.wifiHelper.getWifiState()
            if self.wifiState != wifiState {
                self.isWifiStateChanged = true
                self.wifiState = wifiState
                self.setWifiRefreshTime()
            }
        }
    }
        
    private func setWifiRefreshTime() {
        self.wifiRefreshTime = wifiState.connected ? 1.0 : 0.2
        self.wifiPublisherCancellable?.cancel()
        self.setWifiStatePublisher()
    }
}
