//
//  Constants.swift
//  wifitalk
//
//  Created by escher on 2023/06/10.
//

import FirebaseFirestore

let COLLECTION_CHATROOMS_TITLE = "chatrooms"
let COLLECTION_CHATROOMS = Firestore.firestore().collection(COLLECTION_CHATROOMS_TITLE)

let COLLECTION_CHATROOMS_CHATS_TITLE = "chats"
