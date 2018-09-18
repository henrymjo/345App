//
//  TimeViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 8/20/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

class TimeViewController: UIViewController {
    
    var managedContext: NSManagedObjectContext!
    var editTask = false;
    
    var taskDesc = "";
    var urgency = "low";
    var time: Float = 1.0;
    var reminderDate = Date();
    
    
    @IBOutlet weak var scrollWheel: UISlider!
    
    @IBOutlet weak var hoursIcon: UILabel!
    
    let step: Float = 0.5;
    @IBAction func scrolled(_ sender: UISlider){
        let roundedValue = round(sender.value/step) * step;
        //let hours: Float = scrollWheel.value
        hoursIcon.text = "\(roundedValue)"
        time = roundedValue;
        print("Scroller moved to: \(roundedValue)")
    }
    
    @IBAction func dateChanged(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hoursIcon.text = "\(time)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeController = segue.destination as? NewItem
        homeController?.time = time
        homeController?.taskDesc = taskDesc
        homeController?.urgency = urgency
        homeController?.reminderDate = reminderDate
        homeController?.managedContext = managedContext
        homeController?.editTask = editTask
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
