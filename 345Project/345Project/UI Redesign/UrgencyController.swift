//
//  UrgencyController.swift
//  345Project
//
//  Created by Ryan Spear on 8/14/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class UrgencyController: UIViewController {
    
    var urgency = 0

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
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editController = segue.destination as? NewItem
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
