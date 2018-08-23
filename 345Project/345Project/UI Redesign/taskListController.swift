//
//  taskListController.swift
//  345Project
//
//  Created by Ryan Spear on 8/23/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

var tempTaskList = ["hehe", "wowee", "skrrrt"];



class taskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempTaskList.count;
    }
    /** This goes through each tableViewCell and returns the height of each cell by looking at the index
     of the task and getting its 'time' value. The bigger the time, the taller the cell.
     Commented out for now as the task list needs to be created properly.
     **
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tempTaskList[indexPath].time {
        case: 1..<3:
            return 1
        case: 3..<5:
            return 3
        case: 5..<8:
            return 5
        case: 8..12:
            return 7
        }
    }**/
    
    /** Manipulates the cell style and contents. Probably need to make changes here to make background
        colour = priority colour and length = time.
     use cell.contentView.backgroundColor = [UIColor redColor]; or could use a prototype cell for the
     3 categories of priority
     **/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = tempTaskList[indexPath.row]
        
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
    */

}
