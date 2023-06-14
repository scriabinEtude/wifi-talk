//
//  ReportRepository.swift
//  wifitalk
//
//  Created by escher on 2023/06/14.
//

import Firebase

class ReportRepository: FirebaseRepository {
    typealias Model = Report
    internal var ref = COLLECTION_REPORT
    
    func uploadImage(image: UIImage?, completion: @escaping(String?) -> Void) {
        guard let image = image else {
            completion(nil)
            return
        }
        
        StorageUtil.upload(
            folder: S3_REPORTS_FOLDER,
            image: image,
            quality: 0.5,
            completion: completion
        )
    }
    
}
