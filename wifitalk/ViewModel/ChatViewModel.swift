//
//  WifiChatViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/15.
//

import Firebase

class ChatViewModel: ObservableObject {
    @Published var wifi: Wifi
    @Published var messages = [ChatMessage]()
    let user: User
    let repo: ChatRepository
    
    @Published var isFetcing = true
    @Published var allMessageAreShown = false
    
    @Published var last: ChatMessage?
    var lastMessage: String { last?.message ?? "" }
    
    init(wifi: Wifi, user: User) {
        self.wifi = wifi
        self.user = user
        self.repo = ChatRepository(wifi: wifi, user: user)
        addMessageListener()
    }
}

// MARK: - Fetchs

extension ChatViewModel {
    func addMessageListener() {
        self.isFetcing = true
        self.repo.addMessageListener() { [unowned self] in
            self.messages.append(contentsOf: $0.reversed())
            self.setChatPreview(messages: $0)
            self.isFetcing = false
            print(#function)
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
        
        self.repo.addDocument(model: message) { message in }
    }
}


// MARK: - Helpers

extension ChatViewModel {
    func getBeforeMessage(_ message: ChatMessage) -> ChatMessage? {
        guard
            let index = messages.firstIndex(of: message),
                index > 0
        else { return nil }
        
        return messages[index-1]
    }
    
    func getAfterMessage(_ message: ChatMessage) -> ChatMessage? {
        guard
            let index = messages.firstIndex(of: message),
                index < messages.count - 1
        else { return nil }
        
        return messages[index+1]
    }
    
    private func setChatPreview(messages: [ChatMessage]) {
        self.last = messages.first
    }
}



