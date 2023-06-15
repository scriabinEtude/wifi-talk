//
//  ChatListItem.swift
//  wifitalk
//
//  Created by escher on 2023/06/07.
//

import SwiftUI

struct ChatListItem: View {
    @ObservedObject var vm: ChatViewModel
    
    var body: some View {
        NavigationLink(destination: ChatView(vm:vm)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(vm.wifi.ssid)
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

