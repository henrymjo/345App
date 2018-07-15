//
//  ViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 7/9/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = ["Buy milk", "Pick up Peter", "Eat Ass"]
    var tapped = 0
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (taskMgr.getTaskLength())
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = taskMgr.getTaskName(index: indexPath.row)
        
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
        editController?.taskName?.text = taskName
        editController?.taskEditName = taskName
        editController?.taskIndex = tapped
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool){
        print("Reloading data")
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

