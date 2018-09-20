//
//  ReminderViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 10/09/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

class ReminderViewController: UIViewController {
    

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var managedContext: NSManagedObjectContext!
    var editTask = false;
    var taskDesc = "";
    var urgency = "low";
    var time: Float = 1.0;
    var reminderDate = Date();
    var defaultDays = 0; // This changes depending on if the user has already set a day, and has come back to this screen.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
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
    
    @IBAction func daysStepped(_ sender: Any) {
        dayLabel.text = "\(Int(stepper.value))"
        let numberOfSeconds = (stepper.value * 24 * 60 * 60)
        reminderDate = Date(timeIntervalSinceNow: numberOfSeconds)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("passing back")
        let homeController = segue.destination as? NewItem
        homeController?.time = time;
        homeController?.taskDesc = taskDesc;
        homeController?.urgency = urgency;
        homeController?.reminderDate = reminderDate;
        homeController?.managedContext = managedContext
        homeController?.editTask = editTask
    }
    
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
}
