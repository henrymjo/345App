//
//  TaskEditViewController.swift
//  345Project
//
//  Created by Ryan Spear on 7/15/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class TaskEditViewController: UIViewController {

    @IBOutlet weak var taskName: UILabel?
    @IBOutlet weak var InitialReminder: UISwitch!
    @IBOutlet weak var InitialRepeat: UISegmentedControl!
    @IBOutlet weak var datePicked: UIDatePicker!
    @IBOutlet weak var showDateSelected: UILabel!
    
    var anythingDidChange = false
    var date = Date()
    var remindersOn = false;
    var repeats = 0;
    var taskEditName = ""
    var taskIndex = 0
    
    func showTaskName(task: String){
        taskEditName = task
    
    }
    
    /** Called if the date in the date picker wheel is changed.
        Updates the date variable and shows the current current date chosen below the picker
        (For disability purposes)
    **/
    @IBAction func datePicker(_ sender: UIDatePicker) {
        anythingDidChange = true
        date = datePicked.date
        showDateSelected.text = myDateFormatter(date: date)
        
    }
    
    /** Called if reminders switch is toggled
    **/
    @IBAction func reminderSwitch(_ sender: Any) {
        anythingDidChange = true
        remindersOn = InitialReminder.isOn
    }
    
    /**
     Called if the repeats selector (Once, daily, weekly) is changed
    **/
    @IBAction func repeatSelector(_ sender: UISegmentedControl) {
        anythingDidChange = true;
        repeats = InitialRepeat.selectedSegmentIndex
        
    }
    
    /** Called when "Edit task" button is pressed,
        tests to see if any details have changed,
        if yes then update them and segue back to task list
     **/
    @IBAction func editTask(_ sender: UIButton) {
        
        if(anythingDidChange){
            
            taskMgr.editTask(name: taskEditName, reminder: remindersOn, repeating: repeats, date: date, index: taskIndex)
        
        }
    }
    
    func myDateFormatter(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskName?.text = taskEditName
        InitialReminder.isOn = remindersOn
        InitialRepeat.selectedSegmentIndex = repeats
        datePicked.date = date;
        showDateSelected.text = myDateFormatter(date: date)
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
