//
//  PersistenceController.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import SwiftUI
import CoreData

class DataManager {
    static let shared = DataManager()
    let container = NSPersistentContainer(name: "WifiTalk")
    var user: UserController {
        UserController(context: self.container.viewContext)
    }
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Failed to load: \(error.localizedDescription)")
            }
        }
    }
}
