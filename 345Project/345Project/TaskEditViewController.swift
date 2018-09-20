//
//  TaskEditViewController.swift
//  345Project
//
//  Created by Ryan Spear on 7/15/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//
/**
import UIKit


/** Edit task page controller.
    Shows all currect settings for a task and makes them alterable
    UI should be improved for Accessibily purposes.
 **/
class TaskEditViewController: UIViewController {

    
    @IBOutlet weak var taskName: UILabel? //Task name selected is displayed
    @IBOutlet weak var InitialReminder: UISwitch! //Whether the reminder is initially on or off.
    @IBOutlet weak var InitialRepeat: UISegmentedControl! // What repeats are initally set to
    @IBOutlet weak var datePicked: UIDatePicker! // The date picked, wil start at the original date picked
    @IBOutlet weak var showDateSelected: UILabel! // Label showing what date is selected right now. Accessibility
    
    var anythingDidChange = false // Were any fields altered
    var date = Date() // date currently selected
    var remindersOn = false; // reminders selected
    var repeats = 0; // repeat index selected
    var taskEditName = "" // used to set the task name. Could make this alterable.
    var taskIndex = 0 // the task's index in the task array
    
    
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
    
/** turns a date into the string formate dd-MM-YY HH:mm
    This needs to be changed to be more visusally appealing in the app.
 **/
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
    
    
    /** When the view appears set all the correct values for that task
    **/
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
 **/
