//
//  NewItemController.swift
//  345Project
//
//  Created by Ryan Spear on 7/10/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class NewItemController: UIViewController {
    
    var taskDescription = ""
    var remindersOn = false
    var repeats = 0
    var date = Date()
    
    
    @IBOutlet weak var displayDateChosen: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var repeatTask: UISegmentedControl!
    @IBOutlet weak var ShowDateSelected: UILabel!
    
    /** Task is to be added now. Take all variables, create a new Task instance.
        Use the task instance to fill out cell contents.
    **/
    @IBAction func myDateView(_ sender: UIDatePicker) {
        print("MydateViewMethod")
        let strDate = myDateFormatter(date: datePicker.date)
        date = datePicker.date
        ShowDateSelected.text = strDate
        if(reminderSwitch.isOn){
            displayDateChosen.text = ("Reminder for: \(strDate)")
        } else {
            displayDateChosen.text = ""
        }
    }
    
    @IBAction func remindersToggled(_ sender: Any) {
        if(reminderSwitch.isOn){
            let dateStr = myDateFormatter(date: datePicker.date)
            displayDateChosen.text = ("Reminder for: \(dateStr)")
            
        } else {
            displayDateChosen.text = ""
        }
    }
    
    func myDateFormatter(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    
    @IBAction func addTask(_ sender: UIButton) {
        guard let title = input.text, !title.isEmpty else{
            return
        }
        taskDescription = title
        remindersOn = reminderSwitch.isOn
        repeats = repeatTask.selectedSegmentIndex
        date = datePicker.date
        taskMgr.addTask(name: taskDescription, reminder: remindersOn, repeating: repeats, date: date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        let currentDate = NSDate()
        datePicker.minimumDate = currentDate as Date
        datePicker.date = currentDate as Date
        ShowDateSelected.text = myDateFormatter(date: date)
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
