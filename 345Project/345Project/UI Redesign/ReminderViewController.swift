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
    
    @IBOutlet weak var reminderToggle: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var managedContext: NSManagedObjectContext!
    
    var taskDesc = "";
    var urgency = 0;
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
    
    @IBAction func dateChanged(_ sender: Any) {
        reminderDate = datePicker.date
    }
    
    @IBAction func reminderToggled(_ sender: Any) {
        if(reminderToggle.titleLabel?.text == "ON"){
            reminderToggle.backgroundColor = UIColor.red
            reminderToggle.setTitle("OFF", for: .normal)
        }else{
            reminderToggle.backgroundColor = UIColor.green
            reminderToggle.setTitle("ON", for: .normal)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("passing back")
        let homeController = segue.destination as? NewItem
        homeController?.time = time;
        homeController?.taskDesc = taskDesc;
        homeController?.urgency = urgency;
        homeController?.reminderDate = reminderDate;
        homeController?.managedContext = managedContext
    }
}
