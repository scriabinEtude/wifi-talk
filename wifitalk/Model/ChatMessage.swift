//
//  ChatMessage.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import Foundation

struct ChatMessage: Identifiable, Hashable {
    var id = UUID()
    
    let name: String
    let profileImage: String
    let uuid: String
    let isMine: Bool
    let message: String
    let timestamp: Date
    
    init(name: String, profileImage: String, uuid: String, isMine: Bool, message: String, timestamp: Date) {
        self.name = name
        self.profileImage = profileImage
        self.uuid = uuid
        self.isMine = isMine
        self.message = message
        self.timestamp = timestamp
    }
}
