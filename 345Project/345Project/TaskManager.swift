//
//  TaskManager.swift
//  345Project
//
//  Created by Ryan Spear on 7/10/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()
var tasks = [task]()



struct task{
    var name = "name"
    var reminder = false
    var repeating = 0
}

class TaskManager: NSObject {
    
    func printTasks(){
        for index in 0..<tasks.count{
            print(tasks[index].name)
        }
        print("Done!")
    }
    
    func newTask(name: String, reminder: Bool, repeating: Int) -> task{
        let task1 = task(name: name, reminder: reminder, repeating: repeating)
        return task1
    }
    
    func addTask(name: String, reminder: Bool, repeating: Int){
        print("addTask method")
        tasks.append(newTask(name: name, reminder: reminder, repeating: repeating))
        
    }
    
    func removeTask(indextoRemove: Int){
        tasks.remove(at: indextoRemove)
    }
    
    func getTaskName(index: Int) -> String{
        if tasks.count >= index-1
        {
        return tasks[index].name
        } else {
            return ("")
        }
    }
    
    func getTaskReminder(index: Int) -> Bool{
        if tasks.count >= index-1{
            return tasks[index].reminder
        } else {
            return false
        }
        
    }
    
    func getTaskRepeats(index: Int) -> Int{
        if tasks.count >= index-1{
            return tasks[index].repeating
        } else {
            return 0
        }
    }
    
    func getTaskLength() -> Int{
        return tasks.count
    }
    
    
    
}
