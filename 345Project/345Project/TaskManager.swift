//
//  TaskManager.swift
//  345Project
//
//  Created by Ryan Spear on 7/10/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit


var taskMgr: TaskManager = TaskManager() // instance of task manager to access all task related methods.
var tasks = [task]() // array of tasks on the current list. (Need to make this a class variable, to be done after beta
                     // is submitted)

/** Task Struct. These are the only variables a task currently needs
  * A task Name, Reminders on or off, whether it repeats once, daily or weekly, and the task date.
**/
struct task{
    var name = "name"
    var reminder = false
    var repeating = 0
    var date = Date()
}

/** TaskManager class deals with all task actions:
  * Creating, Deleting, Editing and getting task values.
  * accessed through taskMgr instance
 **/
class TaskManager: NSObject {
    
    /** Prints all task names to the console, debugging purposes **/
    func printTasks(){
        for index in 0..<tasks.count{
            print(tasks[index].name)
        }
    }
    
    /** Creates a neew task using the task struct.
      * Returns the newly created task of type task
    **/
    func newTask(name: String, reminder: Bool, repeating: Int, date: Date) -> task{
        let task1 = task(name: name, reminder: reminder, repeating: repeating, date: date)
        return task1
    }
    
    
    /** Appends a new task to the task array. At the minute it is unsorted but once the task view loads
      * the tasks are sorted by ascending date.
      * This method also makes a call to create the reminder alert at 15 minutes before the task time.
    **/
    func addTask(name: String, reminder: Bool, repeating: Int, date: Date){
        tasks.append(newTask(name: name, reminder: reminder, repeating: repeating, date: date))
        
        if(reminder){
            requestAlerts.createAlert(title: name, subtitle: "subtitle", body: "body", date: date, repeats: repeating)
        }
        
    }
    
    /** Changes the values of a given task in the task array
      * The key here is the index of the task, retrieved by a cell being tapped on in the UITableView
    **/
    func editTask(name: String, reminder: Bool, repeating: Int, date: Date, index: Int){
        tasks[index].name = name
        tasks[index].reminder = reminder
        tasks[index].repeating = repeating
        tasks[index].date = date
    }
    
    /** Removes a task from the task array.
      * TO DO: remove alerts/reminders for tasks that have been removed from the array list.
    **/
    func removeTask(indextoRemove: Int){
        tasks.remove(at: indextoRemove)
    }
    
    /** returns the name of given tasks, used for setting the edit task page title.
      * checks whether the array hols the given index first
      * if index doesn't exist, returns an empty string
    **/
    func getTaskName(index: Int) -> String{
        if tasks.count >= index-1
        {
        return tasks[index].name
        } else {
            return ("")
        }
    }
    
    /** returns true or false depending on whether the tasks reminders are turned on or not.
    **/
    func getTaskReminder(index: Int) -> Bool{
        if tasks.count >= index-1{
            return tasks[index].reminder
        } else {
            return false
        }
        
    }
    
    /** returns an int to represent how often the task repeats.
        0: Once
        1: Daily
        2: Weekly
    **/
    func getTaskRepeats(index: Int) -> Int{
        if tasks.count >= index-1{
            return tasks[index].repeating
        } else {
            return 0
        }
    }
    
    /** returns the number of tasks in the task array **/
    func getTaskLength() -> Int{
        return tasks.count
    }
    
    /** gets the date of a task as a String value
      * takes the index of the task.
    **/
    func getDateString(index: Int) -> String{
        let dateStr = myDateFormatter(date: tasks[index].date)
        return dateStr
    }
    
    /** returns the date of a task as a Date value
      * Used to set reminders and determine whether reminder is too close to current time
      * takes the index of the given task
    **/
    func getDateAsDate(index: Int) -> Date{
        return tasks[index].date;
    }
    
    /** Formats the given Date value as "dd-MM-yy HH:mm
        Returns the String version of that date
    **/
    func myDateFormatter(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    
    
    
    
}
