//
//  taskListController.swift
//  345Project
//
//  Created by Ryan Spear on 8/23/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData


//MARK: Core Data Properties
var resultsController: NSFetchedResultsController<Task>!
let coreDataStack = CoreDataStack()

/**
 Subclass of UIViewController, responsible for controlling the Task List view.
 Uses data stored in the CoreDataStack to populate table view.
 
 Contains buttons and controls for changing colour scheme and adding a new task.
 
 Swiping left on a cell will delete the corresponding Task from the results controller and tapping a cell
 will allow user to edit a task.
 
 Cell heights are adjustable depending on a Task object's 'time' attribute.
 
 Also conforms to UITableViewDelegate and UITableViewDataSource and thus, contains multiple methods for pulling and displaying Task object data in the table view.
 */
class taskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var colourNumber = 0;

    @IBOutlet weak var myTableView: UITableView! // tableView, centerpiece of this controller.
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var newTaskButton: UIButton!
    @IBOutlet weak var colourBlindButton: UIButton!
    
    // When add task button is clicked, perform segue with identifier "newTask".
    @IBAction func addTask(_ sender: UIButton) {
        performSegue(withIdentifier: "newTask", sender: self)
    }
    
    // Sets the number of rows in the tableView to the number of tasks in our coreData storage.
    // If no task objects are contained in the results controller, number of rows is set to zero.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsController.sections?[section].numberOfObjects ?? 0
    }
    
    
    //Once view did appear, reload data. Also request to send alerts if not done so already.
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
        requestAlerts.requestAlerts()
        print("user default: \(UserDefaults.standard.integer(forKey: "mode"))")
    }
 
    @IBAction func nightMode(_ sender: Any) {
        if(colourNumber == 1){
            colourNumber = 0
        } else {
            colourNumber = 1
        }
        
        UserDefaults.standard.set(colourNumber, forKey: "mode")
        checkForNightMode()
        myTableView.reloadData()
    }
    
   
    /** This goes through each tableViewCell and returns the height of each cell by looking at the index
     of the task and getting its 'time' value. The bigger the time, the taller the cell.
    */
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{

        let task = resultsController.object(at: indexPath)
        
        switch task.time {
        case 0..<3:
            return 60.0;
        case 3..<5:
            return 90.0
        case 5..<7:
            return 120.0            // every two hours increments 30 points
        case 7..<9:
            return 150.0
        case 9..<11:
            return 180.0
        case 11..<13:
            return 210.0
        default:
            return 0.0
        }
    }
    
    /** cellForRow at goes through each cell in the table and assigns the title and chooses which
        customCell to use depending on the priority of the task.
        Cells are rounded and I have used a small hack to give a gap between the cells by making the border
        colour white. This makes it looks like they're seperated. If we change the background colour
        cell.layer.borderColor will need to change too.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let task = resultsController.object(at: indexPath)
        let taskName = task.title;
        cell.textLabel?.text = taskName;
        
        /** Default case is low urgency
            Borders are added and coloured white as to make the cells look rounded
        **/
        switch task.urgency {
        case "a":
            let cell = tableView.dequeueReusableCell(withIdentifier: "high") as! highCell
            cell.layer.borderColor = UIColor.white.cgColor
            
            if(UserDefaults.standard.integer(forKey: "mode") == 1){
                cell.backgroundColor = UIColor.gray
                cell.layer.borderColor = UIColor.black.cgColor
            } else {
                cell.backgroundColor = UIColor.red
                cell.layer.borderColor = UIColor.white.cgColor
            }
            cell.taskName.text = taskName;
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 3
            return cell;
            
        case "b":
            let cell = tableView.dequeueReusableCell(withIdentifier: "medium") as! mediumCell
            cell.layer.borderColor = UIColor.white.cgColor
            if(UserDefaults.standard.integer(forKey: "mode") == 1){
                cell.backgroundColor = UIColor.gray
                cell.layer.borderColor = UIColor.black.cgColor
            } else {
                cell.backgroundColor = UIColor.yellow
                cell.layer.borderColor = UIColor.white.cgColor
            }
            cell.taskName.text = taskName;
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 3
            return cell;
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "low") as! lowCell
            cell.layer.borderColor = UIColor.white.cgColor
            
            if(UserDefaults.standard.integer(forKey: "mode") == 1){
                cell.backgroundColor = UIColor.gray
                cell.layer.borderColor = UIColor.black.cgColor
            } else {
                cell.backgroundColor = UIColor.green
                cell.layer.borderColor = UIColor.white.cgColor
            }
            cell.taskName.text = taskName;
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 3
            return cell;
        }
    }
    
    
    /**
        Method for deleting tasks.
        Deletes the task from CoreData and deletes the reminder
        @param tableView is the tableView on the controller
        @param editingStyle is a left swipe on the task in the table view.
        @param indexPath is the index of the task in the tableView
    */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            let task = resultsController.object(at: indexPath)
            resultsController.managedObjectContext.delete(task)
            let taskIdentifier = task.title!
            center.removePendingNotificationRequests(withIdentifiers: [taskIdentifier])
            do{
                try resultsController.managedObjectContext.save()
            }catch{
                print("Delete failed: \(error)")
            }
        }
    }
    
    /**
        If an item is selected, make a segue to the newItem page with the identifier "editTask"
        This means we use the same newItem controller but it doesn't create a new item, just edits
        the selected one.
        @param tableView is the tbaleView in the controller.
        @param indexPath is the index of the task selected.
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editTask", sender: self)
    }
    
    
    /**
        Method does setup for the table when the tableView controller is loaded.
        Fetches from core data and reloads data.
    */
    override func viewDidLoad() {
        print("viewdidload")
        super.viewDidLoad()
        checkForNightMode()
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "urgency", ascending: true)
        request.sortDescriptors = [sortDescriptors]
        resultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        resultsController.delegate = self
        do{
            try resultsController.performFetch()
        }catch{
            print("Perform fetch error: \(error)")
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /** Two possible segues from this controller.
        We either want to create a new item or edit an existing item.
        If editing, set all variables to the selected index. Change "Add Task" button to "Edit Task"
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch(segue.identifier){
        case "editTask":
            if let indexPath = myTableView.indexPathForSelectedRow{
                let selectedRow = indexPath;
                let vc = segue.destination as? NewItem
                let task = resultsController.object(at: selectedRow)
                vc?.managedContext = resultsController.managedObjectContext;
                vc?.currentTask = task
                vc?.reminderDate = task.date!
                vc?.taskDesc = task.title!
                vc?.urgency = task.urgency!
                vc?.time = task.time
                vc?.editTask = true;
                resultsController.managedObjectContext.delete(task)
                let taskIdentifier = task.title!
                center.removePendingNotificationRequests(withIdentifiers: [taskIdentifier])
                do{
                    try resultsController.managedObjectContext.save()
                }catch{
                    print("Delete failed: \(error)")
                }
            }
        break
        case "newTask":
            let vc = segue.destination as? NewItem
            vc?.managedContext = resultsController.managedObjectContext
            vc?.editTask = false;
            if(vc?.managedContext == nil){
                print("Managed context = nil")
            }
        break
        default:
            print("No segue found");
        }
    }
    
    /** Checks to see if the user has enabled colour blind mode.
        If they have the app changes to a grey scale representation.
    **/
    func checkForNightMode(){
        if(UserDefaults.standard.integer(forKey: "mode") == 1){
            colourNumber = 1;
            background.backgroundColor = UIColor.black
            myTableView.backgroundColor = UIColor.black
            let image = #imageLiteral(resourceName: "Image-2")
            let eye = #imageLiteral(resourceName: "Image-3")
            newTaskButton.setImage(image, for: .normal)
            colourBlindButton.setImage(eye, for: .normal)
        } else {
            colourNumber = 0
            background.backgroundColor = UIColor.white
            myTableView.backgroundColor = UIColor.white
            let image = #imageLiteral(resourceName: "Image-1")
            newTaskButton.setImage(image, for: .normal)
            let eye = #imageLiteral(resourceName: "Image")
            colourBlindButton.setImage(eye, for: .normal)
        }
        
    }
    
    
}

/**
 Extensions responsible for refreshing, inserting and deleting rows in the table view based on the
 contents of Core Data and actions of the user.
 */
extension taskListController: NSFetchedResultsControllerDelegate{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myTableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myTableView.endUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                myTableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath{
                myTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        default:
            break
        }
    }
}
