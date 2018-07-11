//
//  TaskManager.swift
//  345Project
//
//  Created by Ryan Spear on 7/10/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task{
    var name = "name"
    var reminder = false
    var repeating = 0
}

class TaskManager: NSObject {
    var tasks = [task]()
    
    func addTask(name: String, reminder: Bool, repeating: Int){
        tasks.append(task(name: name, reminder: reminder, repeating: repeating))
        
        for index in 0..<tasks.count{
            tableTasks[index] = tasks[index].name
        }
    }
    
    func removeTask(indextoRemove: Int){
        tasks.remove(at: indextoRemove)
    }
    
}
