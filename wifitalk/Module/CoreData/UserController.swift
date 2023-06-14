//
//  UserController.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import Foundation
import CoreData
import UIKit

class UserController: DataController {
    
    typealias Model = User
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetch() -> User? {
        let users = self.fetchAll()
        return users.isEmpty ? nil : users[0]
    }
    
    func update(name: String?, binarySource: String?, profileImage: String?) -> User {
        let user = self.fetch() ?? User(context: context)
        if user.uuid == nil {
            user.uuid = UIDevice.current.identifierForVendor?.uuidString
        }
        if name != nil { user.name = name }
        if binarySource != nil { user.binarySource = binarySource }
        if profileImage != nil { user.profileImage = profileImage }
        self.saveContext(context)
        return user
    }
    
    func delete() {
        guard let user = self.fetch() else { return }
        self.context.delete(user)
        self.saveContext(context)
    }
}
