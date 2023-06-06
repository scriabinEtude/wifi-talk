//
//  WifiHelperDelegate.swift
//  wifitalk
//
//  Created by escher on 2023/06/06.
//

import Foundation

protocol WifiHelperDelegate {
    func getWifiState() -> WifiState
}

class WifiHelperDelegateMock: WifiHelperDelegate {
}
