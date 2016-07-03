//
//  AgeVerificationViewController.swift
//  assignment2-prompt
//
//  Created by Lovey on 7/3/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit


class AgeVerificationViewController: ViewController {
    
    let year: Int;
    
    
    required init?(coder aDecoder: NSCoder) {

        let date = NSDate();
        let calendar = NSCalendar.currentCalendar();
        //let components = calendar.components(.NSYearCalendarUnit, date)
        let components = calendar.components(.NSYearCalendarUnit , fromDate: date)
        
        year = components.year;
        
        super.init(coder: aDecoder);
    }
    
    @IBOutlet weak var yearField: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var actionButton: UIBarButtonItem!
    
    @IBAction func verifyClicked(sender: UIBarButtonItem) {
        
        if let birthYear = Int(yearField.text!) {
            let age = year-birthYear;
            if (age < 0) {
                outputLabel.text = "You haven't been born yet.";
            } else if (age < 16) {
                outputLabel.text = "something about the user being a baby.";
            } else if (age < 18) {
                outputLabel.text = "You can drive.";
            } else if (age < 21) {
                outputLabel.text = "You can vote and drive.";
            } else if (age < 120) {
                outputLabel.text = "You can drink, vote and drive.";
            } else {
                outputLabel.text = "Aren't you dead yet?";
            }
            
            
        } else {
            outputLabel.text = "Invalid year entered";
        }
        
    }
    
}