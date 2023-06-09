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
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetch() -> User? {
        let request: NSFetchRequest<User> = User.fetchRequest()
        var fetchedUsers: [User] = []
        
        do {
            fetchedUsers = try self.context.fetch(request)
            return fetchedUsers.isEmpty ? nil : fetchedUsers[0]
        } catch let error {
            print("Error fetching Users \(error)")
            return nil
        }
    }
    
    func update(name: String?, profileImage: String?) -> User {
        let user = self.fetch() ?? User(context: context)
        if user.uuid == nil {
            user.uuid = UIDevice.current.identifierForVendor?.uuidString
        }
        if name != nil { user.name = name }
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
