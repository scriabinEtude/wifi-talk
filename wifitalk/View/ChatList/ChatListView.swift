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
    
    @ObservedObject var vm = ChatListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 50) {
                VStack(alignment: .leading) {
                    if !wifiViewModel.locationPermission.isAuthorised {
                        HStack(spacing: 10) {
                            Label("위치 권한이 없습니다.", systemImage: "location.slash.fill")
                            Button(action: wifiViewModel.requestLocationPermissionFromSetting) {
                                Text("재설정")
                            }
                        }.padding()
                    } else if userViewModel.isCreating {
                        HStack(spacing: 10) {
                            ProgressView()
                            Text("유저를 생성하는 중")
                        }.padding()
                    } else if userViewModel.user == nil {
                        HStack(spacing: 10) {
                            ProgressView()
                            Text("유저 정보를 불러오는 중")
                        }.padding()
                    } else if wifiViewModel.wifiState.connected && vm.chatViewModel != nil {
                        Label("현재 접속된 Wifi", systemImage: "wifi").padding()
                        ChatListItem(
                            vm: vm.chatViewModel!
                        )
                    } else {
                        Label("Wifi 없음", systemImage: "wifi.slash").padding()
                        HStack{ Spacer() }
                    }
                }
                
                VStack(alignment: .leading) {
                    Label("연결 기록", systemImage: "clock.arrow.circlepath").padding()
                    List(wifiViewModel.wifiHistory) { wifi in
                        ChatHistoryItem(wifi: wifi)
                    }.listStyle(.plain) 
                    Spacer()
                }
            }
            .toolbar {
                NavigationLink(destination: { SettingView() }) {
                    HStack {
                        Text(userViewModel.user?.name ?? "")
                            .padding(.trailing, 5)
                        ProfileImageView(
                            source: userViewModel.user?.profileImage,
                            size: 30
                        )
                    }
                }
                .buttonStyle(.plain)
            }
            .onAppear{
                userViewModel.getUser()
                wifiViewModel.getWifiHistories()
            }
            .navigationTitle("채팅")
            .onReceive(wifiViewModel.$wifiState, perform: vm.setWifi)
            .onReceive(userViewModel.$user, perform: vm.setUser)
            
        }
    }
}
