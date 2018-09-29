//
//  UrgencyController.swift
//  345Project
//
//  Created by Ryan Spear on 8/14/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

/**
 UIViewController Subclass, responsible for controlling the Urgency View.
 
 View contains 3 buttons, referred to via the outlets.
 Clicking any single button will segue back to the NewItem view, setting the task data along with
 the updated urgency.
 */
class UrgencyController: UIViewController {
    
    //MARK: Managed Context for Core Data use.
    var managedContext: NSManagedObjectContext!
    
    //Edit Task boolean.
    var editTask = false;
    
    //MARK: Task variables.
    var taskDesc = "" //String for task title
    var urgency = "c" // a, b, c representing urgency from high to low
    var reminderDate = Date() // Will be a date or null.
    var time: Float = 1.0;  // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.
    
    //MARK: Button and view component outlets.
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var medButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var background: UIView!
    
    /** All three of these functions are almost the same.
        If a button is pressed, perform a segue using that button's identifier.
    */
    @IBAction func HighButton(_ sender: UIButton) {
        performSegue(withIdentifier: "high", sender: sender)
    }
    
    @IBAction func MedButton(_ sender: UIButton) {
        performSegue(withIdentifier: "med", sender: sender)
    }
    
    @IBAction func LowButton(_ sender: UIButton) {
        performSegue(withIdentifier: "low", sender: sender)
    }
    
    /** Load the view **/
    override func viewDidLoad() {
        checkForNightMode()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** We are only segueing to one controller so we update all variables first.
        Update the urgency variable depending on which button what clicked.
    **/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editController = segue.destination as? NewItem
        editController?.taskDesc = taskDesc;
        editController?.reminderDate = reminderDate;
        editController?.time = time;
        editController?.managedContext = managedContext
        editController?.editTask = editTask
        
        if(segue.identifier == "high"){
            editController?.urgency = "a"
            // set urgency to high and colour to red
        } else if(segue.identifier == "med"){
            editController?.urgency = "b"
            // set urgency to  med and set colour to yellow
        } else if(segue.identifier == "low"){
            editController?.urgency = "c"
            // set urgency to low and set colour to green
        }
    }
    
    func checkForNightMode(){
        if(UserDefaults.standard.integer(forKey: "mode") == 1){
            background.backgroundColor = UIColor.black
            highButton.backgroundColor = UIColor.gray
            medButton.backgroundColor = UIColor.gray
            lowButton.backgroundColor = UIColor.gray
            
        } else {
            background.backgroundColor = UIColor.white
            highButton.backgroundColor = UIColor.red
            medButton.backgroundColor = UIColor.yellow
            lowButton.backgroundColor = UIColor.green
        }
    }

}
