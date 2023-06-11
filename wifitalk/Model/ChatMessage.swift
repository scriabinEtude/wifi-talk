//
//  ChatMessage.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//


import FirebaseFirestore
import FirebaseFirestoreSwift

struct ChatMessage: Identifiable, Encodable, Decodable, Hashable {
    @DocumentID var id: String?
    
    let name: String
    let profileImage: String
    let uuid: String
    var isMine: Bool
    let message: String
    let timestamp: Timestamp
}

