//
//  StorageUtil.swift
//  wifitalk
//
//  Created by escher on 2023/06/14.
//

import FirebaseStorage
import UIKit

struct StorageUtil {
    static func upload(
        folder: String,
        image: UIImage,
        quality: CGFloat,
        completion: @escaping(String) -> Void
    ) {
        guard let imageData = image.jpegData(compressionQuality: quality) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "\(folder)/\(filename)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                LogUtil.error(#function, error: error)
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
