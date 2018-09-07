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
    
    
    //MARK: Properties
    var managedContext: NSManagedObjectContext!

    var taskDesc = "" //String for task title
    var urgency: Int = 0 // 0, 1, 2 representing urgency
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
        
        taskName.text = taskDesc;
        super.viewDidLoad()
        if(urgency == 2){
            UrgencyButton.backgroundColor = UIColor.red
        } else {
            if(urgency == 1){
                UrgencyButton.backgroundColor = UIColor.yellow
            } else {
                UrgencyButton.backgroundColor = UIColor.green
            }
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
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch(segue.identifier){
        case "urgencyIdentifier":
            print("going to urgency controller")
            let vc = segue.destination as? UrgencyController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
        break
        case "timeIdentifier":
            let vc = segue.destination as? TimeViewController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
        break
        default:
            print("passing to table view")
        }
    }

}
