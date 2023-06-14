//
//  Report.swift
//  wifitalk
//
//  Created by escher on 2023/06/14.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct Report: Encodable, Decodable {
    @DocumentID var id: String?
    
    // report
    let text: String
    let image: String?
    let timestamp: Timestamp
    
    // device
    let deviceName: String
    let deviceModel: String
    let deviceSystemName: String
    let deviceSystemVersion: String
}
