//
//  NewItemController.swift
//  345Project
//
//  Created by Ryan Spear on 7/10/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

/** Visualisation of the current task and be able to make edits to it.
  * Needs to be 10x more visually appealing for Mainly Accessibility issues and also general consumpion
**/
class NewItemController: UIViewController {
    
    /** These variables get sent to the task manager to set the values for
        the task in the task array
    **/
    
    var taskDescription = ""
    var remindersOn = false
    var repeats = 0
    var date = Date()
    
    
    @IBOutlet weak var displayDateChosen: UILabel! // the reminder date Label
    @IBOutlet weak var input: UITextField!         // Text input for the name of the task
    @IBOutlet weak var datePicker: UIDatePicker!   // The date picker, holds value of currently chosen date
    @IBOutlet weak var reminderSwitch: UISwitch!   // Switch for reminders to be on or off, value found using inOn method
    @IBOutlet weak var repeatTask: UISegmentedControl! // 3 values, 0 1 2, for repeats. Once, Daily or Weekly
    @IBOutlet weak var ShowDateSelected: UILabel!  // Current date selected Label
    
    /**
      * Shows the reminder time as a String below the reminder switch, also the current date chosen.
      * Mainly for visually impaired users
      * to be able to listen to the time the task and the reminder is set for for by swiping over the string.
      * Updates as the date picker date is changed.
     **/
    @IBAction func myDateView(_ sender: UIDatePicker) {
        let strDate = myDateFormatter(date: datePicker.date)
        date = datePicker.date
        ShowDateSelected.text = strDate
        if(reminderSwitch.isOn){
            displayDateChosen.text = ("Reminder for: \(getReminderTime(date: datePicker.date))")
        } else {
            displayDateChosen.text = "No Reminder"
        }
    }
    
    
    /**
    * Alters the reminder String if the reminder button is flicker on or off.
    * displays 15 minutes before the task time if on, or "No reminder" if off
    **/
    @IBAction func remindersToggled(_ sender: Any) {
        if(reminderSwitch.isOn){
            displayDateChosen.text = ("Reminder for: \(getReminderTime(date: datePicker.date))")
            
        } else {
            displayDateChosen.text = "No reminder"
        }
    }
    
    /** Formats date as a string to be displayed in a Label
    * Returns the String interpretating of the date given
     **/
    func myDateFormatter(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    
    /**
      * Gets the time 15 minutes before the date given and returns a string
      * If the time 15 minutes before the date is behind the current time, returns a message saying the task is too
      * close for a reminder
     **/
    func getReminderTime(date: Date) -> String{
        
        if(requestAlerts.compareTime(reminderDate: date)){
        
        var reminderDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        reminderDate.minute = reminderDate.minute! - 15
            let calendar = Calendar(identifier: .gregorian)
            let sendDate = calendar.date(from: reminderDate)
            return myDateFormatter(date: sendDate!)
        } else {
            return "Task is time is too close for a reminder"
        }
    }
    
    /**
      *  Action method for when the Add Task button is clicked.
      *  Assigns all fields to variables and calls the Task manager to add to the task array.
    **/
    @IBAction func addTask(_ sender: UIButton) {
        guard let title = input.text, !title.isEmpty else{
            return
        }
        taskDescription = title
        remindersOn = reminderSwitch.isOn
        repeats = repeatTask.selectedSegmentIndex
        date = datePicker.date
        taskMgr.addTask(name: taskDescription, reminder: remindersOn, repeating: repeats, date: date)
    }
    
    /**
      * View has loaded, calls super method.
     **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** Called once the view has appeared instead of loaded.
      * Sets the Date Picker to be set to the current date and time.
      * Makes sure you can't create a task in the past by setting minimum date to current date
    **/
    override func viewDidAppear(_ animated: Bool) {
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        let currentDate = NSDate()
        datePicker.minimumDate = currentDate as Date
        datePicker.date = currentDate as Date
        ShowDateSelected.text = myDateFormatter(date: date)
    }
    


}
