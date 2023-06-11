//
//  QueryUtil.swift
//  wifitalk
//
//  Created by escher on 2023/06/11.
//

import Firebase

extension Query {
    
    func getDocuments<T: Decodable> (completion: @escaping([T]) -> Void) {
        self.getDocuments { snapshot, error in
            if let error = error { LogUtil.error(#function, error: error); return }
            guard let documents = snapshot?.documents else { return }
            let models = documents.compactMap { try? $0.data(as: T.self) }
            completion(models)
        }
    }
    
    func getDocument<T: Decodable> (completion: @escaping(T) -> Void) {
        self.getDocuments { documents in
            completion(documents[0])
        }
    }
}

