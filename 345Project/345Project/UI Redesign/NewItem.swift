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

/** biggest problem now is having the task description keep showing the types words.
    Looks like variables don't get saved when we transition to another controller.
 **/


class NewItem: UIViewController {
    
    struct taskType { // couldn't call it task because of other struct from previous design called task.
        var taskName = "Hello";
        var urgency = "low";
        var reminderDate = Date();
        var time: Float = 0.0;
    }
    
    //MARK: Properties
    var managedContext: NSManagedObjectContext!

    var taskDesc = "Gym" //String for task title
    var urgency = "low" // 0, 1, 2 representing urgency
    var reminderDate = Date() // Will be a date or null.
    var time: Float = 2.0; // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.
    

    @IBOutlet weak var UrgencyButton: UIButton!
    @IBOutlet weak var ReminderButton: UIButton!
    @IBOutlet weak var TimeButton: UIButton!
    @IBOutlet weak var AddTaskButton: UIButton!
    @IBOutlet weak var taskName: UITextField!
    
    
    /* on load set the urgency button colour. Default is red currently **/
    override func viewDidLoad() {
        print("in view did load")
        print("task desc: " + taskDesc)
        taskName.text = title
        super.viewDidLoad()
        if(urgency == "high"){
            UrgencyButton.backgroundColor = UIColor.red
        } else {
            if(urgency == "medium"){
                UrgencyButton.backgroundColor = UIColor.yellow
            } else {
                UrgencyButton.backgroundColor = UIColor.green
            }
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func textEditingDidChange(_ sender: UITextField) {
        title = sender.text!
        print("editing did change, taskDesc: " + taskDesc)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addNewTask(_ sender: Any) {
        print("Task name: " + taskDesc)
        
        let task = Task(context: managedContext)
        task.title = title
        task.urgency = "low"
        task.time = time
        task.date = Date()
        
        do{
            try managedContext.save()
        }catch{
            print("Error saving todo: \(error)")
        }
        
        
        taskManager.createTask(taskName: taskDesc, urgency: urgency, reminderDate: reminderDate, time: time)
    }
    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        }
    }
    */

}
