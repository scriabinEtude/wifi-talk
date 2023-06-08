//
//  wifitalkApp.swift
//  wifitalk
//
//  Created by escher on 2023/06/05.
//

import SwiftUI

@main
struct wifitalkApp: App {
    
    let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ChatListView()
                .environmentObject(appState)
                .environmentObject(appState.wifiViewModel)
                .environmentObject(appState.userViewModel)
        }
    }
}
