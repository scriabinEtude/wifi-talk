//
//  ChatRepository.swift
//  wifitalk
//
//  Created by escher on 2023/06/10.
//

import Firebase
import FirebaseFirestoreSwift

class ChatRepository: FirebaseRepository {
    typealias Model = ChatMessage
    
    let wifi: Wifi
    let user: User
    var cursor: DocumentSnapshot?
    var limit = 30
    
    init(wifi: Wifi, user: User) {
        self.wifi = wifi
        self.user = user
    }
    
    internal var ref: CollectionReference {
        COLLECTION_CHATROOMS.document(self.uid).collection(COLLECTION_CHATROOMS_CHATS_TITLE)
    }
    
    private var uid: String { wifi.bssid + wifi.ssid }
    
    func addMessageListener(completion: @escaping([ChatMessage]) -> Void) {
        let query = self.ref
                        .order(by: "timestamp", descending: true)
                        .limit(to: limit)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            let messages = changes
                .compactMap{ try? self.convertDataToMessage(doc: $0.document, user: self.user) }
            
            self.cursor = changes.last?.document
            completion(messages)
        }
    }
    
    func fetchMessages(completion: @escaping([ChatMessage]) -> Void) {
        var query = self.ref
                        .order(by: "timestamp", descending: true)
                        .limit(to: limit)
        if cursor != nil {
            query = query.start(afterDocument: cursor!)
        }
        
        query.getDocuments { snapshot, error in
            if let error = error { LogUtil.error(#function, error: error); return }
            let messages = snapshot?.documents
                .compactMap{ try? self.convertDataToMessage(doc: $0, user: self.user) }
            
            self.cursor = snapshot?.documents.last
            completion(messages!)
        }
    }
    func getLastMessage(completion: @escaping(ChatMessage) -> Void) {
        let query = self.ref
                        .order(by: "timestamp", descending: true)
                        .limit(to: 1)
        
        query.getDocument(completion: completion)
    }
    
    private func convertDataToMessage(doc: QueryDocumentSnapshot, user: User) throws -> ChatMessage{
        var message = try? doc.data(as: ChatMessage.self)
        message!.isMine = message!.uuid == user.uuid
        return message!
    }
}
