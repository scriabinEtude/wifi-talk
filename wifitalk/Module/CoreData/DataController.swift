//
//  DataController.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import CoreData

class DataController {
    internal func saveContext(_ context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
