//
//  ViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 7/9/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData

/** ViewController class controls the presentation of the task list on the main page.
    Has a table view to control selections.
    sends data to edit task page to show correct fields
 
 TODO:
    - Cell's need to be designed to be bigger and clearer in the future for accessibity concerns.
    - Colour scheme should be alterable for accessibilty concerns.
 **/
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Mark: - Properties
    
    var resultsController: NSFetchedResultsController<Task>!
    let coreDataStack = CoreDataStack()
    

    // Index of the cell that is selected
    var tapped = 0
    
    
    // TableView controller
    @IBOutlet weak var myTableView: UITableView!
    
    
    // choose the number of cells in the table by looking at the legnth of out task array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsController.sections?[section].numberOfObjects ?? 0
    }
    
    /** Fill in cell text label with text
        Could be filled with much more to design cells
    **/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let task = resultsController.object(at: indexPath)
        cell.textLabel?.text = task.title
        
        return cell
    }
    
    /** Implements ability to delete tasks.
 
      *  Complete removal of the alert should also be called here
     **/
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            taskMgr.removeTask(indextoRemove: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    /** Called when a cell is tapped.
        reference using indexPath.row to give the index of the task in the TaskManager array.
    **/
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //print(taskMgr.getTaskName(index: indexPath.row))  prints name of task tapped.
        tapped = indexPath.row
        let taskName = taskMgr.getTaskName(index: indexPath.row)
        let editController = TaskEditViewController()
        editController.taskEditName = taskName
        print(taskName)
        
        performSegue(withIdentifier: "editTask", sender: self)
        
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Preparing")
        
        if let _ = sender as? UIButton, let vc = segue.destination as? NewItemController {
            vc.managedContext = resultsController.managedObjectContext
        }

    }
    
    
    /** Refresh the tableView to show updated tasks when this controller is opened **/
    override func viewDidAppear(_ animated: Bool){
        myTableView.reloadData()
    }
    
    /** Request to send alerts when the app opens for the first time **/
    override func viewDidLoad() {
        super.viewDidLoad()
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "urgency", ascending: false)
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
        
       // requestAlerts.requestAlerts()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: NSFetchedResultsControllerDelegate{
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

