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
    func createAlert(title: String, subtitle: String, body: String, date: Date){
        
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = ""
        content.body = ""
        content.badge = 1;
        
        var triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        triggerDate.hour = 10 // reminder is set for 10am.
            
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false);

        addAlert(trigger: trigger, content: content, identifier: title)
    }
    
    /** adds the alert to the users device.
      *
      * TODO: Change the alert date/time when a task date is edited.
     **/
    func addAlert(trigger: UNCalendarNotificationTrigger, content: UNMutableNotificationContent, identifier: String){
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                //something went wrong
                print("Error adding alert: \(String(describing: error))")
            }
        })
    }
    
}
