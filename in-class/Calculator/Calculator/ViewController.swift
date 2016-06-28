//
//  ViewController.swift
//  Calculator
//
//  Created by Lovey on 6/27/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var leftOp: UITextField!
    
    @IBOutlet weak var rightOp: UITextField!

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func add(sender: UIButton) {
            myLabel.text  = String(getVal(leftOp) + getVal(rightOp))
    }
    
    
    private func getVal(field: UITextField) -> Int {
        if let left = field.text {
            return Int(left)!
        }
        return 0;
    }
}

