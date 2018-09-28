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

    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var medButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var background: UIView!
    /** All three of these functions are almost the same.
        If a button is pressed, perform a segue using that buttons identifier.
     **/
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
    
    /** we are only segueing to once controller so we update all variables first.
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
