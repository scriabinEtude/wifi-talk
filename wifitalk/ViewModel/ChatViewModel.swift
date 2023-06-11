//
//  ChatViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import Firebase

class ChatViewModel: ObservableObject {
    @Published var wifi: Wifi
    @Published var messages = [ChatMessage]()
    let user: User
    let repo: ChatRepository
    
    init(wifi: Wifi, user: User) {
        self.wifi = wifi
        self.user = user
        self.repo = ChatRepository(ssid: wifi.ssid)
//        load()
        addMessageListener()
        
    }
    
    func addMessageListener() {
        self.repo.addMessageListener {
            self.messages.append(contentsOf: $0.reversed())
        }
    }
    
    func load() {
        self.repo.fetchMessages {
            self.messages.append(contentsOf: $0.reversed())
        }
    }
    
    func send(message: String) {
        let message = ChatMessage(
            name: user.name!,
            profileImage: user.profileImage!,
            uuid: user.uuid!,
            isMine: true,
            message: message,
            timestamp: Timestamp(date: Date())
        )
        
        self.repo.sendMessage(message: message) { message in }
    }
    func getLast() {}
}
