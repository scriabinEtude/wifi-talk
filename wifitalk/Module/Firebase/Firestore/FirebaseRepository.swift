//
//  FirebaseRepository.swift
//  wifitalk
//
//  Created by escher on 2023/06/14.
//

import Firebase

protocol FirebaseRepository {
    associatedtype Model: Encodable, Decodable
    
    var ref: CollectionReference { get }
}

extension FirebaseRepository {
    func addDocument(model: Model, completion: @escaping(Model) -> Void) {
        do {
            _ = try self.ref
                .addDocument(from: model)
            completion(model)
        } catch {
            LogUtil.error(#function, error: error)
        }
    }
}
