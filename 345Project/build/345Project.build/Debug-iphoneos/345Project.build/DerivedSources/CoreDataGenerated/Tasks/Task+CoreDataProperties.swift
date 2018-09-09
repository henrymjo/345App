//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Ryan Spear on 9/9/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var date: Date?
    @NSManaged public var time: Float
    @NSManaged public var title: String?
    @NSManaged public var urgency: String?

}
