//
//  NewItem.swift
//  345Project
//
//  Created by Ryan Spear on 8/14/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

let taskManager: taskListController = taskListController()



class NewItem: UIViewController {
    
    
    //MARK: Properties
    var currentTask: Task?
    var managedContext: NSManagedObjectContext!
    
    // if edit task is true, "add task" becomes "edit task" and we try and edit a task instead of creating a new one.
    var editTask = false;
    var indexPath: IndexPath = []; // passed from taskListController, need better way to do this.
    
    var taskDesc = "" //String for task title
    var urgency = "low" // 0, 1, 2 representing urgency
    var reminderDate = Date() // Will be a date or null.
    var time: Float = 1.0; // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.
    

    @IBOutlet weak var UrgencyButton: UIButton!
    @IBOutlet weak var ReminderButton: UIButton!
    @IBOutlet weak var TimeButton: UIButton!
    @IBOutlet weak var AddTaskButton: UIButton!
    @IBOutlet weak var taskName: UITextField!
    
    
    /* on load set the urgency button colour. Default is red currently **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("task desc: " + taskDesc)
        
        taskName.text = taskDesc;
        if(urgency == "high"){
            UrgencyButton.backgroundColor = UIColor.red
        } else {
            if(urgency == "medium"){
                UrgencyButton.backgroundColor = UIColor.yellow
            } else {
                UrgencyButton.backgroundColor = UIColor.green
            }
        }
        if(editTask){
            AddTaskButton.setTitle("Edit Task", for: .normal) // add task becomes edit task.
            // pull task from managed context. let task = resultsController
            let task = resultsController.object(at: indexPath)
            currentTask = task
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func textEditingDidChange(_ sender: UITextField) {
        taskDesc = sender.text!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addNewTask(_ sender: Any) {
        print("Task name: " + taskDesc)
        
        // if this is a new task, create a new task with the current context and save.
        if(!editTask){
            let task = Task(context: managedContext)
            task.title = taskDesc
            task.urgency = urgency
            task.time = time
            task.date = reminderDate;
            
            do{
                try managedContext.save()
            }catch{
                print("Error saving todo: \(error)")
            }
        } else {
            /** if we are editing a task, get the task from the results list and edit the values.
                Need Henry to help with this. It sort of edits the task but doesn't change the title in taskList
                At the minute I don't have any taskIndex variables in the other view controllers so clicking into
                one of those will fuck up the task index
                Do we need to fetch using an ID or keep using the taskIndex from taskListController?
                attempting to save the managed context also causes a crash
             
                Tried a couple of different things but usually get the same error*/
            
            currentTask?.title = taskDesc
            currentTask?.time = time
            currentTask?.urgency = urgency
            currentTask?.date = Date()
            //print("task: \(currentTask)");
            
            
            do{
                try managedContext.save() // this causes crash too
            }catch{
                print("Error saving todo: \(error)")
            }
            
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch(segue.identifier){
        case "urgencyIdentifier":
            let vc = segue.destination as? UrgencyController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
            vc?.managedContext = managedContext
            vc?.editTask = editTask
        break
        case "timeIdentifier":
            let vc = segue.destination as? TimeViewController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
            vc?.managedContext = managedContext
            vc?.editTask = editTask
        break
        case "reminderIdentifier":
            let vc = segue.destination as? ReminderViewController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
            vc?.managedContext = managedContext
            vc?.editTask = editTask
        break
        default:
            print("passing to table view")
        }
    }

}
