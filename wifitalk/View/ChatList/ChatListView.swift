//
//  ChatListView.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject var wifi: WifiViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if wifi.wifiState.connected {
                    Label("현재 접속된 Wifi", systemImage: "wifi").padding()
                    ChatListItem(wifi: wifi.wifiState.wifi!)
                } else {
                    Label("Wifi 없음", systemImage: "wifi.slash").padding()
                    HStack{ Spacer() }
                }
                
                
                Label("연결 기록", systemImage: "clock.arrow.circlepath").padding()
                
                
                List(wifi.wifiHistory, id: \.ssid) { wifi in
                    ChatHistoryItem(wifi: wifi)
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .toolbar {
                NavigationLink(destination: { SettingView() }) {
                    HStack {
                        Text(Mock.user.name).foregroundColor(Color.black)
                    }
                }
            }
        }
        
        
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
