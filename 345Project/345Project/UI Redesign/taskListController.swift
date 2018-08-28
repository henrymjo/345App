//
//  taskListController.swift
//  345Project
//
//  Created by Ryan Spear on 8/23/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

var tempTaskList = ["hehe", "wowee", "skrrrt"];

var taskList = [taskType]()

struct taskType { // couldn't call it task because of other struct from previous design called task.
    var taskName = "";
    var urgency = "low";
    var reminderDate = Date();
    var time: Float = 0.0;
}



class taskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func createTask(taskName: String, urgency: String, reminderDate: Date, time: Float){
        let newTask = taskType(taskName: taskName, urgency: urgency, reminderDate: reminderDate, time: time)
        taskList.append(newTask)
        
        // create a reminder here.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count;
    }
    /** This goes through each tableViewCell and returns the height of each cell by looking at the index
     of the task and getting its 'time' value. The bigger the time, the taller the cell.
     Commented out for now as the task list needs to be created properly.
    **/
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let thisTask: taskType = taskList[indexPath.row]
        
        switch thisTask.time {
        case 1..<3:
            return 1.0;
        case 3..<5:
            return 3.0
        case 5..<8:
            return 5.0            // arbitrary numbers returned atm
        case 8..<13:
            return 7.0
        default:
            return 1.0
        }
    }
    
    /** Manipulates the cell style and contents. Probably need to make changes here to make background
        colour = priority colour and length = time.
     use cell.contentView.backgroundColor = [UIColor redColor]; or could use a prototype cell for the
     3 categories of priority
     **/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let task = taskList[indexPath.row]
        let taskName = task.taskName
        
        
        switch task.urgency {
        case "high":
            let cell = tableView.dequeueReusableCell(withIdentifier: "high") as! highCell
 
        case "medium":
            let cell = tableView.dequeueReusableCell(withIdentifier: "medium") as! mediumCell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "low") as! lowCell
            }
        // how to initialise cell before switch statement and be empty? who knows!!?!?!
        cell.taskName.text = taskName;
        return cell;
    }
    

    var tapped = 0;
    
    
    
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
    **/

}
