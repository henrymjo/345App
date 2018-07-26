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
    var date = Date()
}

class TaskManager: NSObject {
    
    func printTasks(){
        for index in 0..<tasks.count{
            print(tasks[index].name)
        }
        print("Done!")
    }
    
    func newTask(name: String, reminder: Bool, repeating: Int, date: Date) -> task{
        let task1 = task(name: name, reminder: reminder, repeating: repeating, date: date)
        return task1
    }
    
    func addTask(name: String, reminder: Bool, repeating: Int, date: Date){
        print("addTask method")
        tasks.append(newTask(name: name, reminder: reminder, repeating: repeating, date: date))
        
        if(reminder){
            requestAlerts.createAlert(title: name, subtitle: "subtitle", body: "body", date: date, repeats: repeating)
        }
        
    }
    
    func editTask(name: String, reminder: Bool, repeating: Int, date: Date, index: Int){
        tasks[index].name = name
        tasks[index].reminder = reminder
        tasks[index].repeating = repeating
        tasks[index].date = date
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
    
    
    func getDateString(index: Int) -> String{
        let dateStr = myDateFormatter(date: tasks[index].date)
        return dateStr
    }
    
    func getDateAsDate(index: Int) -> Date{
        return tasks[index].date;
    }
    
    func myDateFormatter(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    
    
    
    
}
