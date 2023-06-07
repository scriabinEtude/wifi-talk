//
//  wifitalkApp.swift
//  wifitalk
//
//  Created by escher on 2023/06/05.
//

import SwiftUI

@main
struct wifitalkApp: App {
    @StateObject private var dataController = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ChatListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(WifiViewModel(wifiHelper: WifiHelperMock())
            )
        }
    }
}
