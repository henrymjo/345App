//
//  TaskEditViewController.swift
//  345Project
//
//  Created by Ryan Spear on 7/15/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class TaskEditViewController: UIViewController {

    @IBOutlet weak var taskName: UILabel?
    @IBOutlet weak var InitialReminder: UISwitch!
    @IBOutlet weak var InitialRepeat: UISegmentedControl!
    
    var taskEditName = ""
    var taskIndex = 0
    
    func showTaskName(task: String){
        print("My task name is:  \(task)")
        
        taskEditName = task
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskName?.text = taskEditName
        InitialReminder.isOn = taskMgr.getTaskReminder(index: taskIndex)
        InitialRepeat.selectedSegmentIndex = taskMgr.getTaskRepeats(index: taskIndex)
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