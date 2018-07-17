//
//  NewItemController.swift
//  345Project
//
//  Created by Ryan Spear on 7/10/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class NewItemController: UIViewController {
    
    var taskDescription = ""
    var remindersOn = false
    var repeats = 0
    

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var repeatTask: UISegmentedControl!
    
    /** Task is to be added now. Take all variables, create a new Task instance.
        Use the task instance to fill out cell contents.
    **/

    @IBAction func addTask(_ sender: UIButton) {
    if(input.text != ""){
        taskDescription = input.text!
        remindersOn = reminderSwitch.isOn
        repeats = repeatTask.selectedSegmentIndex
        taskMgr.addTask(name: taskDescription, reminder: remindersOn, repeating: repeats)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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