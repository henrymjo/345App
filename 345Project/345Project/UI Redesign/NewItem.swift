//
//  NewItem.swift
//  345Project
//
//  Created by Ryan Spear on 8/14/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

//let taskManager: taskListController = taskListController()


/**
 Subclass of UIViewController, controls the New Item View.
 User can edit the task name through the UITextField outlet as well
 as segue to other views, containing controls for time, urgency and reminder variables that are
 associated with a given task.
 
 When segue-ing to another view, the class will set the task's attribute variables in the destination view controller,
 as well as passing the managed context so that the full list of Task Objects is always kept in scope.
 
 When NewItem is called from an edit action (tapping a cell in Task List View), editTask variable becomes true
 and taskDesc, urgency, reminderDate and time variables are set to the selected task's attribute values.
 
 Upon pressing add/edit task, a new Task object is created and added to the managedContext object for Core Data
 conformity.
 */
class NewItem: UIViewController {
    
    
    //MARK: Properties
    var currentTask: Task?
    var managedContext: NSManagedObjectContext!
    
    @IBOutlet var background: UIView!
   
    var editTask = false;
    
    var taskDesc = "" //String for task title}
    var urgency = "c" // a, b, c representing urgency in descending order
    var reminderDate = Date() // Date for the reminder.
    var time: Float = 1.0; // hours as a decimal. eg, 3.5 = 3 hours 30 minutes.
    
    //Mark: Outlets
    @IBOutlet weak var UrgencyButton: UIButton!
    @IBOutlet weak var ReminderButton: UIButton!
    @IBOutlet weak var TimeButton: UIButton!
    @IBOutlet weak var AddTaskButton: UIButton!
    @IBOutlet weak var taskName: UITextField!
    
    
    /** On load, set the urgency colour to the colour selected.
        Also, if we are editing a task, change the "Add Task" button to "Edit Task"
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskName.text = taskDesc;

        if(urgency == "a"){
            UrgencyButton.backgroundColor = UIColor.red
        } else {
            if(urgency == "b"){
                UrgencyButton.backgroundColor = UIColor.yellow
            } else {
                UrgencyButton.backgroundColor = UIColor.green
            }
        }
        
        checkForNightMode()
        
        if(editTask){
            AddTaskButton.setTitle("Edit Task", for: .normal) // add task becomes edit task.
            
        }
    }

    // Update task description when text is changed in the text box.
    @IBAction func textEditingDidChange(_ sender: UITextField) {
        taskDesc = sender.text!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Confirm new task/ confirm edit of existing task.
    //Saves all variables to CoreData as a Task. Or updates existing variables of a CoreData task.
    @IBAction func addNewTask(_ sender: Any) {
        if(taskDesc != ""){
        let task = Task(context: managedContext)
        task.title = taskDesc
        task.urgency = urgency
        task.time = time
        task.date = reminderDate;
        if(isFutureDate(date: reminderDate)){
            requestAlerts.createAlert(title: taskDesc, subtitle: taskDesc, body: taskDesc, date: reminderDate);
        }
        do{
            try managedContext.save()
        }catch{
            print("Error saving todo: \(error)")
        }
        }
    }
    
    
    /**
        4 possible segues from here.
        Urgency page, time page, reminder page or going back to the initial task view page.
        Variables get passed between pages so that if we revisit a page to change the last chosen value,
        The page remembers that value and the counters will continue on from it.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch(segue.identifier){
        case "urgencyIdentifier":
            let vc = segue.destination as? UrgencyController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
            vc?.managedContext = managedContext
            vc?.editTask = editTask
        break
        case "timeIdentifier":
            let vc = segue.destination as? TimeViewController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
            vc?.managedContext = managedContext
            vc?.editTask = editTask
        break
        default:
            let vc = segue.destination as? ReminderViewController
            vc?.taskDesc = taskDesc
            vc?.urgency = urgency
            vc?.time = time
            vc?.reminderDate = reminderDate
            vc?.managedContext = managedContext
            vc?.editTask = editTask
        }
    }
    
    
    func checkForNightMode(){
        let red: CGFloat = 106.0
        let green: CGFloat = 207.0
        let blue: CGFloat = 255.0
        let bluecolour = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
        
        if(UserDefaults.standard.integer(forKey: "mode") == 1){
            background.backgroundColor = UIColor.black
            UrgencyButton.backgroundColor = UIColor.gray
            ReminderButton.backgroundColor = UIColor.gray
            TimeButton.backgroundColor = UIColor.gray
            AddTaskButton.backgroundColor = UIColor.gray
            taskName.backgroundColor = UIColor.white

        } else {
            background.backgroundColor = UIColor.white
            UrgencyButton.backgroundColor = bluecolour
            ReminderButton.backgroundColor = bluecolour
            TimeButton.backgroundColor = bluecolour
            AddTaskButton.backgroundColor = bluecolour
        }
    }
    
    
    //Test if the date is not today.
    func isFutureDate(date: Date) -> Bool{
        if(date.timeIntervalSinceNow > (60*60)*4){
            return true;
    }
        
        return false;
    }
}
