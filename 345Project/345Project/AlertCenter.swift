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
    
    var triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
    if(repeats == 1){
        triggerDate = Calendar.current.dateComponents([.day, .hour, .minute], from: date)
        } else {
            if(repeats == 2){
                triggerDate = Calendar.current.dateComponents([.weekday, .day, .hour, .minute], from: date)
            }
        }
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: repeatsAreOn)
    addAlert(trigger: trigger, content: content)
    
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

}

