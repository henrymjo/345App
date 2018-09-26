//
//  CustomCells.swift
//  345Project
//
//  Created by Ryan Spear on 8/28/18.
//  Copyright © 2018 Henry Morrison-Jones. All rights reserved.
//

import UIKit

class CustomCells: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/** Three classes identical other than a unique identifier is associated with each
  * class. This identifier is used to adjust backgrounds later on.
 **/
class highCell: UITableViewCell{
    @IBOutlet weak var taskName: UILabel!
    
}

class mediumCell: UITableViewCell{
    
    @IBOutlet weak var taskName: UILabel!
    
}

class lowCell: UITableViewCell{
    
    @IBOutlet weak var taskName: UILabel!
    
}

