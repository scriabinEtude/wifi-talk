//
//  ChatView.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var vm: ChatViewModel
    @State var messageInput: String = ""
    
    init(wifi: Wifi, user: User) {
        vm = ChatViewModel(wifi: wifi, user: user)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach($vm.messages, id: \.self) { message in
                            ChatMessageView(message: message.wrappedValue)
                        }.onChange(of: vm.messages.count) { _ in
                            scrollToLast(proxy: proxy)
                        }.onAppear {
                            scrollToLast(proxy: proxy)
                        }
                    }
                }
                    
                MessageInputView(
                    messageInput: $messageInput,
                    onSend: send
                )
            }
        }
        .navigationTitle(vm.wifi.name)
    }
}

// MARK: - Helper

extension ChatView {
    func send(message: String) {
        guard !message.isEmpty else { return }
        vm.send(message: message)
        messageInput = ""
    }
    
    func scrollToLast(proxy: ScrollViewProxy) {
        if vm.messages.last != nil {
            proxy.scrollTo(vm.messages.last!)
        }
    }
}
