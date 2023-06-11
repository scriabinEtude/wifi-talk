//
//  ChatMessage.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//


import FirebaseFirestoreSwift
import 

struct ChatMessage: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let name: String
    let profileImage: String
    let uuid: String
    let isMine: Bool
    let message: String
    let timestamp: Timestamp
}
