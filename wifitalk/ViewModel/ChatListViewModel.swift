//
//  ChatListViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/15.
//

import SwiftUI

class ChatListViewModel: ObservableObject {
    @Published var chatViewModel: ChatViewModel?
    
    var user: User?
    var wifi: Wifi?
}

extension ChatListViewModel {
    private func setChatViewModel() {
        guard
            let user = self.user,
            let wifi = self.wifi,
            self.chatViewModel?.wifi != self.wifi,
            self.chatViewModel?.user != self.user
        else { return }
        self.chatViewModel = ChatViewModel(
            wifi: wifi,
            user: user
        )
    }
    
    func setUser(_ user: User?) {
        guard let user = user else { return }
        self.user = user
        self.setChatViewModel()
    }
    
    func setWifi(_ wifi: Wifi?) {
        guard let wifi = wifi else { return }
        self.wifi = wifi
        self.setChatViewModel()
    }
    
    func setWifi(_ wifiState: WifiState) {
        self.setWifi(wifiState.wifi)
    }
}
