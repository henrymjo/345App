//
//  ViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 7/9/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = ["Buy milk", "Pick up Peter", "Eat Ass"]
    var tapped = 0
    
    var resultsController: NSFetchedResultsController<ToDo>!
    let coreDataStack = CoreDataStack()
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return (taskMgr.getTaskLength())
        
        return resultsController.sections?[section].objects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        //cell.textLabel?.text = taskMgr.getTaskName(index: indexPath.row)
        
        //Configuring cell
        let todo = resultsController.object(at: indexPath)
        cell.textLabel?.text = todo.title
        
        return cell
    }
    
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
        
        if segue.identifier == "editTask" {
        
        
            let editController = segue.destination as? TaskEditViewController
            let taskName = taskMgr.getTaskName(index: tapped)
            print("Tapped index: \(tapped)")
        
            
            editController?.date = taskMgr.getDateAsDate(index: tapped)
            editController?.taskEditName = taskName
            editController?.remindersOn = taskMgr.getTaskReminder(index: tapped)
            editController?.repeats = taskMgr.getTaskRepeats(index: tapped)
            editController?.taskIndex = tapped
        
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool){
        print("Reloading data")
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptors]
        resultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        do{
            try resultsController.performFetch()
        } catch {
            print("Perform fetch error: \(error)")
        }
      
        requestAlerts.requestAlerts()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

