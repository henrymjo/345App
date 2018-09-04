//
//  taskListController.swift
//  345Project
//
//  Created by Ryan Spear on 8/23/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

var taskList = [taskType]()

struct taskType { // couldn't call it task because of other struct from previous design called task.
    var taskName = "Hello";
    var urgency = "low";
    var reminderDate = Date();
    var time: Float = 0.0;
}



class taskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
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
     
     For some reason this method never gets called, although it should in the tableset up or reloadData().
     **/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        print("heightforrowat")
        return 140.0;
        /**
        print("in heightforrow")
        let thisTask: taskType = taskList[indexPath.row]
        print("thisTask: \(thisTask)")
        
        switch thisTask.time {
        case 0..<3:
            return 1.0;
        case 3..<5:
            return 3.0
        case 5..<8:
            return 5.0            // arbitrary numbers returned atm
        case 8..<13:
            return 7.0
        default:
            return 1.0
        }**/
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
            cell.taskName.text = taskName;
            return cell;
            
        case "medium":
            let cell = tableView.dequeueReusableCell(withIdentifier: "medium") as! mediumCell
            cell.taskName.text = taskName;
            return cell;
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "low") as! lowCell
            cell.taskName.text = taskName;
            return cell;
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            taskList.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
