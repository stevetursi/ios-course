//
//  ViewController.swift
//  Printer
//
//  Created by Lovey on 6/29/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textToPrint: UITextField!
    
    @IBOutlet weak var times: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func goPrintStuff(sender: UIBarButtonItem) {
        
        if let
            textToPrint = textToPrint.text,
            countString = times.text,
            countInt = Int(countString) {
            var result = "";
            for _ in 0..<(countInt < 0 ? 0 : countInt) {
                result = result + textToPrint + "\r\n"
            }
            
            output.textColor = UIColor.blackColor();
            
            output.text = (result);
        } else {
            output.text = ("invalid count");
            output.textColor = UIColor.redColor();
            
        }
        
    }
}

