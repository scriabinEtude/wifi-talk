//
//  wifitalkApp.swift
//  wifitalk
//
//  Created by escher on 2023/06/05.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct wifitalkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
