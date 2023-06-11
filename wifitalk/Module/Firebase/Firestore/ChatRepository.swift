//
//  ChatRepository.swift
//  wifitalk
//
//  Created by escher on 2023/06/10.
//

import Firebase
import FirebaseFirestoreSwift

struct ChatRepository {
    let ssid: String
    var cursor: DocumentSnapshot?
    var limit = 40
    
    private var chatRef: CollectionReference {
        COLLECTION_CHATROOMS.document(self.ssid).collection(COLLECTION_CHATROOMS_CHATS_TITLE)
    }
    
    func addMessageListener(completion: @escaping([ChatMessage]) -> Void) {
        let query = self.chatRef
                        .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap{ try? $0.document.data(as: ChatMessage.self) }
            completion(messages)
        }
    }
    
    func fetchMessages(completion: @escaping([ChatMessage]) -> Void) {
        var query = self.chatRef
                        .order(by: "timestamp", descending: true)
                        .limit(to: limit)
        if cursor != nil {
            query = query.start(atDocument: cursor!)
        }
        
        query.getDocuments(completion: completion)
    }
    func getLastMessage(completion: @escaping(ChatMessage) -> Void) {
        let query = self.chatRef
                        .order(by: "timestamp", descending: true)
                        .limit(to: 1)
        
        query.getDocument(completion: completion)
    }
    
    func sendMessage(message: ChatMessage, completion: @escaping(ChatMessage) -> Void) {
        do {
            _ = try self.chatRef
                .addDocument(from: message)
            completion(message)
        } catch {
            LogUtil.error(#function, error: error)
        }
    }
}
