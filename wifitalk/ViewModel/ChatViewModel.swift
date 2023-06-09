//
//  ChatViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var wifi: Wifi
    @Published var messages = [ChatMessage]()
    let user: User
    
    init(wifi: Wifi, user: User) {
        self.wifi = wifi
        self.user = user
    }
    
    func load(offset: Int, count: Int) {}
    func send(message: String) {
        messages.append(
            ChatMessage(
                name: user.name!,
                profileImage: user.profileImage!,
                uuid: user.uuid!,
                isMine: true,
                message: message,
                timestamp: Date()
            )
        )
    }
    func getLast() {}
}
