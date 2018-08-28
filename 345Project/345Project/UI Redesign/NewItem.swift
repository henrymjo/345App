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

    
    var taskName = "" // String
    var urgency = "low" // 0, 1, 2 representing urgency
    var reminderDate = Date() // Will be a date or null.
    var time: Float = 0.0; // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.
    

    @IBOutlet weak var UrgencyButton: UIButton!
    @IBOutlet weak var ReminderButton: UIButton!
    @IBOutlet weak var TimeButton: UIButton!
    @IBOutlet weak var AddTaskButton: UIButton!
    
    /** function called when textField editing ends **/
    @IBAction func TaskNameEntry(_ sender: UITextField) {
        taskName = sender.text!
    }
    
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
        taskManager.createTask(taskName: taskName, urgency: urgency, reminderDate: reminderDate, time: time)
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
