//
//  ChatListView.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject var wifiViewModel: WifiViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 50) {
                VStack(alignment: .leading) {
                    if userViewModel.isCreating {
                        HStack(spacing: 10) {
                            ProgressView()
                            Text("유저를 생성하는 중")
                        }.padding()
                    } else if userViewModel.user == nil {
                        HStack(spacing: 10) {
                            ProgressView()
                            Text("유저 정보를 불러오는 중")
                        }.padding()
                    } else if wifiViewModel.wifiState.connected {
                        Label("현재 접속된 Wifi", systemImage: "wifi").padding()
                        ChatListItem(
                            wifi: wifiViewModel.wifiState.wifi!,
                            user: userViewModel.user!
                        )
                    } else {
                        Label("Wifi 없음", systemImage: "wifi.slash").padding()
                        HStack{ Spacer() }
                    }
                }
                
                VStack(alignment: .leading) {
                    Label("연결 기록", systemImage: "clock.arrow.circlepath").padding()
                    
                    
                    List(wifiViewModel.wifiHistory, id: \.ssid) { wifi in
                        ChatHistoryItem(wifi: wifi)
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                }
                
                
                
            }
            .toolbar {
                NavigationLink(destination: { SettingView() }) {
                    HStack {
                        Text(userViewModel.user?.name ?? "").foregroundColor(Color.black).padding(.trailing, 5)
                        ProfileImageView(withBase64: userViewModel.user?.profileImage, size: 30)
                    }
                }
            }
            .onAppear{
                userViewModel.getUser()
            }
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
