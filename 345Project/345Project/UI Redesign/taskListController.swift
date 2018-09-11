//
//  taskListController.swift
//  345Project
//
//  Created by Ryan Spear on 8/23/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

var taskList = [taskType]()

struct taskType { // couldn't call it task because of other struct from previous design called task.
    var taskName = "Hello";
    var urgency = "low";
    var reminderDate = Date();
    var time: Float = 0.0;
}

//Core Data Properties
var resultsController: NSFetchedResultsController<Task>!
let coreDataStack = CoreDataStack()


class taskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows in section");
        return resultsController.sections?[section].numberOfObjects ?? 0
    }
    /** This goes through each tableViewCell and returns the height of each cell by looking at the index
     of the task and getting its 'time' value. The bigger the time, the taller the cell.
     
     For some reason this method never gets called, although it should in the tableset up or reloadData().
     **/
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{

        print("heightforrowat")
        
        
        //print("in heightforrow")
        let task = resultsController.object(at: indexPath)
        
        switch task.time {
        case 0..<3:
            return 60.0;
        case 3..<5:
            return 100.0
        case 5..<8:
            return 140.0            // arbitrary numbers returned atm
        case 8..<13:
            return 180.0
        default:
            return 0.0
        }
    }
    
    /** Manipulates the cell style and contents. Probably need to make changes here to make background
     colour = priority colour and length = time.
     use cell.contentView.backgroundColor = [UIColor redColor]; or could use a prototype cell for the
     3 categories of priority
     **/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let task = resultsController.object(at: indexPath)
        let taskName = task.title;
        cell.textLabel?.text = taskName;
        
        //let task = taskList[indexPath.row]
        
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
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "date", ascending: true)
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
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let _ = sender as? UIButton, let vc = segue.destination as? NewItem {
            vc.managedContext = resultsController.managedObjectContext
            if(vc.managedContext == nil){
                print("managedContext = nil")
            }
            print("passing")
        }
        
    }
    
}

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
        default:
            break
        }
    }
}
