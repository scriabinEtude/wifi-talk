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
    
    func fetchMessages(completion: @escaping([ChatMessage]) -> Void) {
        var ref = self.chatRef
                    .order(by: "timestamp", descending: true)
                    .limit(to: limit)
        if cursor != nil {
            ref = ref.start(atDocument: cursor!)
        }
        
        ref.getDocuments { snapshot, error in
            if let error = error { LogUtil.error(#function, error: error); return }
            guard let documents = snapshot?.documents else { return }
            let chats = documents.compactMap { snapshot in
                guard let data = snapshot.data() else { return }
                return ChatMessage(name: data[""], profileImage: <#T##String#>, uuid: <#T##String#>, isMine: <#T##Bool#>, message: <#T##String#>, timestamp: <#T##Timestamp#>)
            }
            completion(chats)
        }
                    
    }
//    func getLastMessage() -> ChatMessage {}
//    func sendMessage(message: ChatMessage) {}
}
