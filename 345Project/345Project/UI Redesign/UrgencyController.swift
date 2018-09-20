//
//  UrgencyController.swift
//  345Project
//
//  Created by Ryan Spear on 8/14/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

class UrgencyController: UIViewController {
    
    var managedContext: NSManagedObjectContext!
    var editTask = false;
    
    var taskDesc = "" //String for task title
    var urgency = "low" // 0, 1, 2 representing urgency
    var reminderDate = Date() // Will be a date or null.
    var time: Float = 1.0;  // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.

    @IBAction func HighButton(_ sender: UIButton) {
        performSegue(withIdentifier: "high", sender: sender)
    }
    
    @IBAction func MedButton(_ sender: UIButton) {
        performSegue(withIdentifier: "med", sender: sender)
    }
    
    @IBAction func LowButton(_ sender: UIButton) {
        performSegue(withIdentifier: "low", sender: sender)
    }
    
    
    override func viewDidLoad() {
        print("taskDesc: " + taskDesc)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editController = segue.destination as? NewItem
        editController?.taskDesc = taskDesc;
        print("Set newItem.taskDesc = to: " + taskDesc);
        editController?.reminderDate = reminderDate;
        editController?.time = time;
        editController?.managedContext = managedContext
        editController?.editTask = editTask
        
        if(segue.identifier == "high"){
            editController?.urgency = "high"
            // set urgency to high and colour to red
        } else if(segue.identifier == "med"){
            editController?.urgency = "medium"
            // set urgency to  med and set colour to yellow
        } else if(segue.identifier == "low"){
            editController?.urgency = "low"
            // set urgency to low and set colour to green
        }
    }

}
