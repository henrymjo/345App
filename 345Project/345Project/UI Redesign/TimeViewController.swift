//
//  TimeViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 8/20/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    var taskDesc = "";
    var urgency = 0;
    var time: Float = 0.0;
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
        if(segue.identifier == "timeIdentifier"){
            let homeController = segue.destination as? NewItem
            homeController?.time = time;
            homeController?.taskDesc = taskDesc;
            homeController?.urgency = urgency;
            homeController?.reminderDate = reminderDate;
            
        }
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
