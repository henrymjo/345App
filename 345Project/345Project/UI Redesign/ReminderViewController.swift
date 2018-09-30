//
//  ReminderViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 10/09/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

/**
 Subclass of UIViewController, responsible for controlling the Reminder view.
 
 View allows a user to set the date that they wish to be reminded on. Currently, reminders are set to go off at 6:00am on a selected day
 but we expect this to become customisable in future releases.
 */
class ReminderViewController: UIViewController {
    

    @IBOutlet weak var dayLabel: UILabel! // Label displaying the currently chosen day
    @IBOutlet weak var stepper: UIStepper! // The buttons used to increase/decrease days.
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var managedContext: NSManagedObjectContext!
    var editTask = false;
    
    //MARK: New/Edited task's attributes
    var taskDesc = "";
    var urgency = "c";
    var time: Float = 1.0;
    var reminderDate = Date();
    var defaultDays = 0; // This changes depending on if the user has already set a day, and has come back to this screen.

    override func viewDidLoad() {
        checkForNightMode()
        super.viewDidLoad()
        
        
    }
    
    /** Finds how many days from now the date was previously set to.
        If it hasn't already been set the days from now will be 0, the default value to show.
        Also give the stepper value that number of days, otherwise changing the days will reset back to 0.
    **/
    override func viewDidAppear(_ animated: Bool) {
        let days = daysFromNow(reminderDate: reminderDate)
        dayLabel.text = "\(days)";
        defaultDays = days;
        stepper.value = Double(defaultDays)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** The day has been increased/decreased using the buttons.
        Update the the label and the reminderDate.
    **/
    @IBAction func daysStepped(_ sender: Any) {
        dayLabel.text = "\(Int(stepper.value))"
        let numberOfSeconds = (stepper.value * 24 * 60 * 60)
        reminderDate = Date(timeIntervalSinceNow: numberOfSeconds)
    }
    
    /** Prepare for segue back to newItem.
        Update all variables.
     **/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newItemController = segue.destination as? NewItem
        newItemController?.time = time;
        newItemController?.taskDesc = taskDesc;
        newItemController?.urgency = urgency;
        newItemController?.reminderDate = reminderDate;
        newItemController?.managedContext = managedContext
        newItemController?.editTask = editTask
    }
    
    /** finds how many days from now reminderDate is.
        Counts from both day's midnight as to not get middle of the day confusion.
        @param reminderDate the date the reminder is set for.
        @return Int the number of days the date is from now. 0 if the same day.
    **/
    func daysFromNow(reminderDate: Date) -> Int{
        
        let currentDate = Date()
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: currentDate)
        let date2 = calendar.startOfDay(for: reminderDate)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        if(components.day != nil){
            return components.day!;
        }
        return 0;
    }
    
    func checkForNightMode(){
        
        let red: CGFloat = 106.0
        let green: CGFloat = 207.0
        let blue: CGFloat = 255.0
        let bluecolour = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
        
        if(UserDefaults.standard.integer(forKey: "mode") == 1){
            confirmButton.backgroundColor = UIColor.gray
        } else {
            confirmButton.backgroundColor = bluecolour
        }
    }
}
