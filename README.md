# 345App
COSC345 Software Engineering App - Henry Morrison-Jones and Ryan Spear

## Introduction

This repository is host to the files that make up the time management application decided upon as the basis for our COSC345 software engineering project. The project aims to provide an easy to use software application for managing time and tasks effectively whilst also catering for visually impaired users.

Note: this application has been developed in xCode 9.3.1 and earlier versions may not support the build.

## Deployment:
  - Clone or download the repository.
  - Open the xCode project and select the iPhone model you which to simulate the application on.
  - Once the model has been selected, click the 'build and run' play button and the application should open within the simulator.
  
## Project Structure and Description

The Project Consists of one main storyboard with 5 views, each with its own subclass of UIViewController. A brief rundown of all the views and associated files is given below, although the in-file documentation and commenting should be considered for a more complete understanding of how the code works.

### Task List View

The Task List Controller view and is the main view, which will load upon application launch and also display the list of tasks that have been created by the user. The View Controller repsonsible for this view is taskListController.swift

taskListController.swift is a subclass of UIViewController and uses data stored in the CoreData stack to populate the table view. The file also conforms to UITableViewDelegate and UITableViewDataSource protocols and thus, contains multiple methods for pulling and displaying Task objects.

Cell heights in this view are adjustable depending on a task object's 'time' attribute and CustomCells.swift should be looked over to gain a further understanding of how the cells are customised.

 Swiping left on a cell will delete the corresponding Task from the results controller and tapping a cell
 will allow user to edit a task.

### New Item View
The NewItem view is accessed through the tasklist view via the big + image button. The ViewController responsible for this view is NewItem.swift.

NewItem.swift is a subclass of UIViewController and here, users can edit the task name through the UITextField outlet as well as segue to other views, containing controls for customising time, urgency and reminder variables that are associated with a given task.

All data associated with a new task is contained in the taskDesc, urgency, time and reminderDate variables. The values contained in these variables are passed between and set by the ViewControllers responsible for task customisation.

When segue-ing to another view, the class will set the task's attribute variables in the destination view controller, as well as passing the managed context so that the full list of Task Objects is always kept in scope.

When NewItem is called from an edit action (tapping a cell in Task List View), editTask variable becomes true and taskDesc, urgency, reminderDate and time variables are set to the selected task's attribute values.

Upon pressing add/edit task, a new Task object is created and added to the managedContext object for Core Data conformity.

### Urgency View
Urgency View is accessed through the New Item view and contains three buttons indicating the urgency that a user wishes to associate with a task. The view is controlled by the UrgencyController.swift file.

Clicking any single button will segue back to the NewItem view, where the 'prepare' function will set the Task's attribute variables to the values contained in the UrgencyController.swift file. The file also contains an NSManagedObjectContext containing the list of Task objects so that all of the Task objects may remain in scope while a new task is being added.

### Time View
Time view is accessed through the New Item view and contains two interactive components - a scrollwheel, where the user can set the expected timeframe of the task, and a 'Confirm' button, which will segue the user back to the NewItem view so they may continue customising the task or confirm and create it.

The Time view is controlled via the TimeViewController, a subclass of UIViewController. This contains the code for updating the time label in the view, setting the task's time variable and also the code responsible for passing the task's attributes and NSManagedObjectContext back to the NewItem.swift ViewController upon confirmation.

### Reminder View
The Reminder view is accessed through the NewItem view and is similar in appearance to the Time View. It too, has only two interactive components, including a 'Confirm' button and a stepper that allows a user to set a reminder date in 'x' amount of days.

The view is controlled via the ReminderViewController.swift file, a subclass of UIViewController. This file contains code for updating the days label in the view, setting the task's reminderDate variable and also code responsible for passing the task's attributes and NSManageObjectContext variables back to the NewItem.swift ViewController upon confirmation

### AlertCenter.swift
Insert details about how alertcenter.swift works

### CustomCells.swift
Insert details about what CustomCells Swift is used for.

### Unit Tests
Currently, unit testing exists only for checking whether the program can successfully pass task information between NewItem and the ViewControllers responsible for customising task data. These tests can be run though using command+U in the Xcode project. 

Currently all tests are passing and we expect further test cases to be added in future releases.
