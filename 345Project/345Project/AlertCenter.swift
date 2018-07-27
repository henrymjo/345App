//
//  alertCenter.swift
//  345Project
//
//  Created by Ryan Spear on 7/22/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit
import UserNotifications

var requestAlerts: AlertCenter = AlertCenter()
let center = UNUserNotificationCenter.current()

class AlertCenter: NSObject{
    
    func toggleAlerts(){
        
    }
    
    func requestAlerts(){
        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
    }
    
    func createAlert(title: String, subtitle: String, body: String, date: Date, repeats: Int){
        
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = 1;
        var repeatsAreOn = false
        if(repeats != 0){
            repeatsAreOn = true
        }
        if(compareTime(reminderDate: date)){ // reminder date is further than 15 minutes away.
            var triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            triggerDate.minute = triggerDate.minute! - 15
            if(repeats == 1){
                triggerDate = Calendar.current.dateComponents([.day, .hour, .minute], from: date)
                triggerDate.minute = triggerDate.minute! - 15
                
            } else {
                if(repeats == 2){
                    triggerDate = Calendar.current.dateComponents([.weekday, .day, .hour, .minute], from: date)
                    triggerDate.minute = triggerDate.minute! - 15
                    
                }
            }
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: repeatsAreOn)
            addAlert(trigger: trigger, content: content)
        } else {
            print("Task too close to remind");
        }
    }
    
    func addAlert(trigger: UNCalendarNotificationTrigger, content: UNMutableNotificationContent){
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                //something fucked up
            }
        })
    }
    
    func compareTime(reminderDate: Date) -> Bool{
        
        if(reminderDate.timeIntervalSinceNow > ((15*60) + 20)){ // if reminder time is further than 15 minutes + 20 seconds away then we can make the reminder.
            return true;
        }
        return false;
    }
}
