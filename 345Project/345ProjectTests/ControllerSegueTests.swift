//
//  _45ProjectTests.swift
//  345ProjectTests
//
//  Created by Henry Morrison-Jones on 7/9/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import XCTest
@testable import _45Project

class ControllerSegueTests: XCTestCase {
    
    var newItemController: NewItem!
    var urgencyController: UrgencyController!
    var timeController: TimeViewController!
    var reminderController: ReminderViewController!
    
    let taskDesc = "Gym"
    let time: Float = 2.5
    let date = Date()
    let urgency = "a"
    
    override func setUp() {
        //Create instances of the view controllers ready to test their segues.
        newItemController = NewItem()
        urgencyController = UrgencyController()
        timeController = TimeViewController()
        reminderController = ReminderViewController()
        
        //Set task data in the NewItem View Controller
        newItemController.taskDesc = taskDesc
        newItemController.time = time
        newItemController.reminderDate = date
        newItemController.urgency = urgency
        
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        newItemController = nil
    }
    
    func testNewItemToUrgencySegue() {
        
        let testSegue = UIStoryboardSegue(identifier: "urgencyIdentifier", source: newItemController, destination: urgencyController)
        
        newItemController.prepare(for: testSegue, sender: newItemController)
        
        XCTAssert(urgencyController.taskDesc == taskDesc)
        XCTAssert(urgencyController.urgency == urgency)
        XCTAssert(urgencyController.time == time)
        XCTAssert(urgencyController.reminderDate == date)
        
        XCTAssertFalse(urgencyController.taskDesc == " ")
        XCTAssertFalse(urgencyController.urgency == "c")
        XCTAssertFalse(urgencyController.time == 1.0)
        XCTAssertFalse(urgencyController.reminderDate == Date())
        
    }
    
    func testNewItemToTimeSegue(){
        
        let testSegue = UIStoryboardSegue(identifier: "timeIdentifier", source: newItemController, destination: timeController)
        
        newItemController.prepare(for: testSegue, sender: newItemController)
        
        XCTAssert(timeController.taskDesc == taskDesc)
        XCTAssert(timeController.urgency == urgency)
        XCTAssert(timeController.time == time)
        XCTAssert(timeController.reminderDate == date)
        
        XCTAssertFalse(timeController.taskDesc == " ")
        XCTAssertFalse(timeController.urgency == "c")
        XCTAssertFalse(timeController.time == 1.0)
        XCTAssertFalse(timeController.reminderDate == Date())
        
    }
    
    func testNewItemToReminderSegue(){
        
        let testSegue = UIStoryboardSegue(identifier: "reminderIdentifier", source: newItemController, destination: reminderController)
        
        newItemController.prepare(for: testSegue, sender: newItemController)
        
        XCTAssert(reminderController.taskDesc == taskDesc)
        XCTAssert(reminderController.urgency == urgency)
        XCTAssert(reminderController.time == time)
        XCTAssert(reminderController.reminderDate == date)
        
        XCTAssertFalse(reminderController.taskDesc == " ")
        XCTAssertFalse(reminderController.urgency == "c")
        XCTAssertFalse(reminderController.time == 1.0)
        XCTAssertFalse(reminderController.reminderDate == Date())
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
