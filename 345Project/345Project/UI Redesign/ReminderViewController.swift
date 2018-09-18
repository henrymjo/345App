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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("taskDesc: \(taskDesc)")
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
}
