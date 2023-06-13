//
//  DataController.swift
//  wifitalk
//
//  Created by escher on 2023/06/08.
//

import CoreData

protocol DataController {
    associatedtype Model: NSManagedObject
    var context: NSManagedObjectContext { get }
}

extension DataController {
    
    internal func fetchAll() -> [Model] {
        let request = Model.fetchRequest() as! NSFetchRequest<Model>
        
        do {
            return try self.context.fetch(request)
        } catch let error {
            print("Error fetching Users \(error)")
            return []
        }
    }
    
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
