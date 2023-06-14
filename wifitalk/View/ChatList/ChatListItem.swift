//
//  ChatListItem.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatListItem: View {
    @ObservedObject var vm = ChatListItemViewModel()
    let wifi: Wifi
    let user: User
    
    init(wifi: Wifi, user: User) {
        self.wifi = wifi
        self.user = user
    }
    
    var body: some View {
        NavigationLink(destination: ChatView(viewModel:ChatViewModel(
            wifi: wifi,
            user: user,
            delegate: vm
        ))) {
            HStack {
                VStack(alignment: .leading) {
                    Text(wifi.ssid)
                        .bold()
                    Text(vm.lastMessage)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
            }
            .padding()
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

