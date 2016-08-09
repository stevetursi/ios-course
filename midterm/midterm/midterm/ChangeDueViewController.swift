//
//  ChangeDueViewController.swift
//  midterm
//
//  Created by Steven Tursi on 8/9/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class ChangeDueViewController: UIViewController {
    
    @IBOutlet weak var changeDueLabel: UILabel!
    
    var changeDue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeDueLabel.text = "\(Utility.priceReadable(changeDue))"
        
    }
    
    @IBAction func startOverButton(sender: AnyObject) {
        
        
        
    }
    
}
