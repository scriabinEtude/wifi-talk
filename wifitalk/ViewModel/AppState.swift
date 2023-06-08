//
//  AppState.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import Foundation

class AppState: ObservableObject {
    var wifiViewModel = WifiViewModel(wifiHelper: WifiHelperMock())
    var userViewModel = UserViewModel()
}
