//
//  ChatListItemViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/14.
//

import SwiftUI

class ChatListItemViewModel: ObservableObject {
//    @Published var unRead: Int = 0
    @Published var last: ChatMessage?
    
    var lastMessage: String { last?.message ?? "" }
}

extension ChatListItemViewModel: ChatViewModelDelegate {
    func onListenNewMessages(_ messages: [ChatMessage]) {
        last = messages.first
    }
}
