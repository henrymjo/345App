//
//  TimeViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 8/20/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

/** Class controls the updating and presenting of the time taken to perform the given task.
    Uses a scrollWheel to adjust time.
**/

class TimeViewController: UIViewController {
    
    var managedContext: NSManagedObjectContext!
    var editTask = false;
    
    var taskDesc = "";
    var urgency = "low";
    var time: Float = 1.0;
    var reminderDate = Date();
    
    
    // Scroll wheel, moved to chose number of hours
    @IBOutlet weak var scrollWheel: UISlider!
    
    // shows the currently selected number of hours.
    @IBOutlet weak var hoursIcon: UILabel!
    
    // Hours counter increments in 0.5 steps.
    let step: Float = 0.5;
    
    /** Called when scroll wheel is moved.
        sets the time and displays the number moved to.
        @param sender the scrollWheel
    **/
    @IBAction func scrolled(_ sender: UISlider){
        let roundedValue = round(sender.value/step) * step;
        //let hours: Float = scrollWheel.value
        hoursIcon.text = "\(roundedValue)"
        time = roundedValue; 
    }
    
    /** sets time to display the previously chosen time when entering back into the controller.
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hoursIcon.text = "\(time)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** Only one segue to prepare for out of this controller, back to the newItem controller.
        Update all variables and perform segue.
     **/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newItemController = segue.destination as? NewItem
        newItemController?.time = time
        newItemController?.taskDesc = taskDesc
        newItemController?.urgency = urgency
        newItemController?.reminderDate = reminderDate
        newItemController?.managedContext = managedContext
        newItemController?.editTask = editTask
    }
 
}
