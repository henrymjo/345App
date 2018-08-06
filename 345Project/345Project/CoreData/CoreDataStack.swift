//
//  CoreDataStack.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 7/08/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "345App")
        container.loadPersistentStores { (description, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
        }
        return container
    }
    var managedContext: NSManagedObjectContext{
        return container.viewContext
    }
}
