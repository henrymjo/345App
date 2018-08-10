//
//  alertCenter.swift
//  345Project
//
//  Created by Ryan Spear on 7/22/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import UserNotifications

/** AlertCenter instance, used to access all alert methods. **/
var requestAlerts: AlertCenter = AlertCenter()

/** center is needed to request notifications and to add notifications to list*/
let center = UNUserNotificationCenter.current()


/** AlertCenter class deals with all things relating to notifications and alerts.
 TODO: give alerts specific indexes so we can remove them if the task gets deleted
 **/

class AlertCenter: NSObject{
    
    func toggleAlerts(){
        
    }
    
    /** Requests the ability to send reminders the first time the user opens the app.
    **/
    func requestAlerts(){
        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
    }
    
    /** Creates an alert to be triggered 15 minutes before the task time.
      * Depending on what repeating choice user makes it will alert the same time daily, weekly or just once.
      * Alert title is the name of the task.
    **/
    func createAlert(title: String, subtitle: String, body: String, date: Date, repeats: Int){
        
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = ""
        content.body = ""
        content.badge = 1;
        var repeatsAreOn = false
        if(repeats != 0){
            repeatsAreOn = true
        }
        if(compareTime(reminderDate: date)){ // true task time is further than 15 minutes away
            // if repeats are once. this effectively sets it to yearly, but reminder should be deleted along with task
            var triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            triggerDate.minute = triggerDate.minute! - 15
            if(repeats == 1){ // If repeats are daily
                triggerDate = Calendar.current.dateComponents([.day, .hour, .minute], from: date)
                triggerDate.minute = triggerDate.minute! - 15
                
            } else {
                if(repeats == 2){ // If repeats are weekly
                    triggerDate = Calendar.current.dateComponents([.weekday, .day, .hour, .minute], from: date)
                    triggerDate.minute = triggerDate.minute! - 15
                    
                }
            }
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: repeatsAreOn)
            
            /** Adds alert to the device alerts **/
            addAlert(trigger: trigger, content: content)
        } else {
            print("Task too close to remind"); // debugging purposes only, compareTime deals with communicating with user
        }
    }
    
    /** adds the alert to the users device.
      * Possibly make the identifier unique so we can delete reminders.
      * TODO: Change the alert date/time when a task date is edited.
     **/
    func addAlert(trigger: UNCalendarNotificationTrigger, content: UNMutableNotificationContent){
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                //something fucked up
            }
        })
    }
    
    /** Tests to see whether the task time is further than 15 minutes into the future
      * return true if it is
    **/
    func compareTime(reminderDate: Date) -> Bool{
        
        if(reminderDate.timeIntervalSinceNow > ((15*60) + 20)){ // if reminder time is further than 15 minutes + 20 seconds away then we can make the reminder.
            return true;
        }
        return false;
    }
}
