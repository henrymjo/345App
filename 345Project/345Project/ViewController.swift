//
//  ViewController.swift
//  345Project
//
//  Created by Henry Morrison-Jones on 7/9/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

var tableTasks: [String] = []


class ViewController: UIViewController {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (tableTasks.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = tableTasks[indexPath.row]
        
        return(cell)
    }
    /** removes a task from the table. Needs to get sent to TaskManager.
        Use indexPath.row to get the index of the task to be removed.
     **/
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            tableTasks.remove(at: indexPath.row)
            taskMgr.removeTask(indextoRemove: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool){
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

