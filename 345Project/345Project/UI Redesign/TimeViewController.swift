//
//  TimeViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 8/20/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    
    
    @IBOutlet weak var scrollWheel: UISlider!
    
    @IBOutlet weak var hoursIcon: UILabel!
    
    @IBAction func scrolled(_ sender: UISlider){
        let hours: Float = scrollWheel.value
        hoursIcon.text = "\(hours)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
