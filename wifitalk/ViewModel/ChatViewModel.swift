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
    let delegate: ChatViewModelDelegate
    
    @Published var isFetcing = true
    @Published var allMessageAreShown = false
    
    init(wifi: Wifi, user: User, delegate: ChatViewModelDelegate) {
        self.wifi = wifi
        self.user = user
        self.repo = ChatRepository(wifi: wifi, user: user)
        self.delegate = delegate
        addMessageListener()
    }
}

// MARK: - Fetchs

extension ChatViewModel {
    func addMessageListener() {
        self.isFetcing = true
        self.repo.addMessageListener() {
            self.messages.append(contentsOf: $0.reversed())
            self.delegate.onListenNewMessages($0)
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
        
        self.repo.addDocument(model: message) { message in }
    }
    func getLast() {}
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
}


// MARK: - Delegate

protocol ChatViewModelDelegate {
    func onListenNewMessages(_ messages: [ChatMessage])
}
