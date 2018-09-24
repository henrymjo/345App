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
    
    var taskDesc = "" //String for task title
    var urgency = "low" // 0, 1, 2 representing urgency
    var reminderDate = Date() // Will be a date or null.
    var time: Float = 1.0; // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.
    

    @IBOutlet weak var UrgencyButton: UIButton!
    @IBOutlet weak var ReminderButton: UIButton!
    @IBOutlet weak var TimeButton: UIButton!
    @IBOutlet weak var AddTaskButton: UIButton!
    @IBOutlet weak var taskName: UITextField!
    
    
    /** On load, set the urgency colour to the colour selected.
        Also, if we are editing a task, change the "Add Task" button to "Edit Task"
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("task desc: " + taskDesc)
        
        taskName.text = taskDesc;
        if(urgency == "a"){
            UrgencyButton.backgroundColor = UIColor.red
        } else {
            if(urgency == "b"){
                UrgencyButton.backgroundColor = UIColor.yellow
            } else {
                UrgencyButton.backgroundColor = UIColor.green
            }
        }
        if(editTask){
            AddTaskButton.setTitle("Edit Task", for: .normal) // add task becomes edit task.
            // pull task from managed context. let task = resultsController
            
        }
        // Do any additional setup after loading the view.
    }

    /** update task description when text is changed in the text box
    **/
    @IBAction func textEditingDidChange(_ sender: UITextField) {
        taskDesc = sender.text!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** Conform new task/ confirm edit of existing task.
        Saves all variables to CoreData as a Task. Or updates existing variables of a CoreData task.
    **/
    @IBAction func addNewTask(_ sender: Any) {
        print("Task name: " + taskDesc)
        let task = Task(context: managedContext)
        task.title = taskDesc
        task.urgency = urgency
        task.time = time
        task.date = reminderDate;
        if(isFutureDate(date: reminderDate)){
            requestAlerts.createAlert(title: taskDesc, subtitle: taskDesc, body: taskDesc, date: reminderDate);
        }
        do{
            try managedContext.save()
        }catch{
            print("Error saving todo: \(error)")
        }
    }
    
    
    /**
        4 possible segues from here.
        Urgency page, time page, reminder page or going back to the initial task view page.
        Variables get passed between pages so that if we revisit a page to change the last chosen value,
        The page remembers that value and the counters will continue on from it.
     **/
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
    
    func isFutureDate(date: Date) -> Bool{
        if(date.timeIntervalSinceNow > (60*60)*4){
            return true;
    }
        
        return false;
    }
}
