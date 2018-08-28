//
//  NewItem.swift
//  345Project
//
//  Created by Ryan Spear on 8/14/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

let taskManager: taskListController = taskListController()

class NewItem: UIViewController {

    
    var taskDesc = "" // String
    var urgency = "low" // 0, 1, 2 representing urgency
    var reminderDate = Date() // Will be a date or null.
    var time: Float = 0.0; // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.
    

    @IBOutlet weak var UrgencyButton: UIButton!
    @IBOutlet weak var ReminderButton: UIButton!
    @IBOutlet weak var TimeButton: UIButton!
    @IBOutlet weak var AddTaskButton: UIButton!
    @IBOutlet weak var taskName: UITextField!
    
    
    /* on load set the urgency button colour. Default is red currently **/
    override func viewDidLoad() {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addNewTask(_ sender: Any) {
        taskDesc = taskName.text!
        print("Task name: " + taskDesc)
        taskManager.createTask(taskName: taskDesc, urgency: urgency, reminderDate: reminderDate, time: time)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
