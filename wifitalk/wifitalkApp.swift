//
//  wifitalkApp.swift
//  wifitalk
//
//  Created by escher on 2023/06/05.
//

import SwiftUI

@main
struct wifitalkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WifiViewModel(wifiHelper: WifiHelperMock())
            )
        }
    }
}
