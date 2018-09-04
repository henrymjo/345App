//
//  ViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 7/9/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

/** ViewController class controls the presentation of the task list on the main page.
    Has a table view to control selections.
    sends data to edit task page to show correct fields
 
 TODO:
    - Cell's need to be designed to be bigger and clearer in the future for accessibity concerns.
    - Colour scheme should be alterable for accessibilty concerns.
 **/
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    // Index of the cell that is selected
    var tapped = 0
    
    
    // TableView controller
    @IBOutlet weak var myTableView: UITableView!
    
    
    // choose the number of cells in the table by looking at the legnth of out task array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (taskMgr.getTaskLength())
    }
    
    /** Fill in cell text label with text
        Could be filled with much more to design cells
    **/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = taskMgr.getTaskName(index: indexPath.row)
        
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
    
    
    /** Data gets sent to the edit conroller so they can be seen and altered correctly.
    **/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editTask" {
        
        
            let editController = segue.destination as? TaskEditViewController
            let taskName = taskMgr.getTaskName(index: tapped)
            print("Tapped index: \(tapped)")
        
            
            /** send all the set fields to edit controlled **/
            editController?.date = taskMgr.getDateAsDate(index: tapped)
            editController?.taskEditName = taskName
            editController?.remindersOn = taskMgr.getTaskReminder(index: tapped)
            editController?.repeats = taskMgr.getTaskRepeats(index: tapped)
            editController?.taskIndex = tapped
        
        }
    }
    
    
    /** Refresh the tableView to show updated tasks when this controller is opened **/
    override func viewDidAppear(_ animated: Bool){
        myTableView.reloadData()
    }
    
    /** Request to send alerts when the app opens for the first time **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAlerts.requestAlerts()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

