//
//  TimeViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 8/20/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

/**
 Subclass of UIViewControllerClass, responsible for controlling the Time view.
 The view controlled is accessed through the NewItem view and allows a user to associate an expected length of time to the task.
 
 View contains a scrollwheel, which allows a user to scroll between time values of 0.0 and 12.0, moving up in steps of 0.5.
 Upon 'confirming' a time, the controller will pass the stored task data to the NewItem ViewController, including the updated time value.
*/
class TimeViewController: UIViewController {
    
    
    var managedContext: NSManagedObjectContext!
    var editTask = false;
    
    //MARK: Task data
    var taskDesc = "";
    var urgency = "c";
    var time: Float = 1.0;
    var reminderDate = Date();
    
    @IBOutlet weak var confirmButton: UIButton!
    
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
        checkForNightMode()
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
    
    /** checks to see if app is in colour blind mode.
        Creates a UIColour which is the same as the crayon "Sky"
        This is the colour used for the button.
    **/
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
