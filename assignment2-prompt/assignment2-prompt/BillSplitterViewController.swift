//
//  BillSplitterViewController.swift
//  assignment2-prompt
//
//  Created by Lovey on 7/3/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class BillSplitterViewController: UIViewController {
    
    
    @IBOutlet weak var numberOfPeople: UITextField!
    @IBOutlet weak var amountOfBill: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    @IBOutlet weak var eachPersonResult: UILabel!
    @IBOutlet weak var totalResult: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBAction func calculateClicked(sender: UIBarButtonItem) {
        eachLabel.hidden = true;
        totalLabel.hidden = true;
        errorLabel.text = "";
        totalResult.text = "";
        eachPersonResult.text = "";

        
        if let people = Int(numberOfPeople.text!) {
            if let bill = Float(amountOfBill.text!) {
                if let percent = Float(tipPercent.text!) {
                    
                    if people != 0 {
                    
                        eachLabel.hidden = false;
                        totalLabel.hidden = false;
                    
                        let totalBill = bill + bill*(percent/100);
                        
                        totalResult.text =  String(format: "$ %.2f", totalBill);
                    
                        eachPersonResult .text = String(format: "$ %.2f", totalBill/(Float(people))  );
                    } else {
                        
                        errorLabel.text = "Zero people?";
                        
                    }
                } else {
                    errorLabel.text = "Invalid tip amount";
                }
            } else {
                errorLabel.text = "Invalid amount of bill";
            }
        } else {
            errorLabel.text = "Invalid number of people";
        }
        
        
        
        
    }
}