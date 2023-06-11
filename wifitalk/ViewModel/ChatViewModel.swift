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
    
    @Published var isFetcing = true
    @Published var allMessageAreShown = false
    
    init(wifi: Wifi, user: User) {
        self.wifi = wifi
        self.user = user
        self.repo = ChatRepository(ssid: wifi.ssid, user: user)
        addMessageListener()
        
    }
    
    func addMessageListener() {
        self.isFetcing = true
        self.repo.addMessageListener() {
            self.messages.append(contentsOf: $0.reversed())
            self.isFetcing = false
        }
    }
    
    func fetch() {
        if self.isFetcing || self.allMessageAreShown { return }
        self.isFetcing = true
        self.repo.fetchMessages {
            if $0.isEmpty {
                self.allMessageAreShown = true
                return
            }
            self.messages.insert(contentsOf: $0.reversed(), at: 0)
            self.isFetcing = false
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
