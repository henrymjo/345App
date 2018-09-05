//
//  CoreDataStack.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 5/09/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    var container: NSPersistentContainer{
        let container = NSPersistentContainer(name: "Tasks")
        container.loadPersistentStores { (description, error) in
            guard error == nil else{
                print("Error: \(error!)")
                return
            }
        }
        print(container.name)
        return container
    }
    
    var managedContext: NSManagedObjectContext{
        return container.viewContext
    }
}
