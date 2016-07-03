//
//  GuessNumViewController.swift
//  assignment2-prompt
//
//  Created by Lovey on 7/3/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class GuessNumViewController: UIViewController {
    
    var num: Int;
    
    
    required init?(coder aDecoder: NSCoder) {
        
        num = Int(arc4random_uniform(10) + 1);
        
        super.init(coder: aDecoder);
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberGuess: UITextField!
    
    @IBAction func guessClicked(sender: UIBarButtonItem) {
        
        if let guess = Int(numberGuess.text!) {
            
            if (guess < 1 || guess > 10) {
                resultLabel.textColor = UIColor.redColor();
                resultLabel.text = "That's not between 1 and ten!";
                
            } else {
                if (guess == num) {
                    resultLabel.textColor = UIColor.greenColor();
                    resultLabel.text = "You're a winner!";
                    num = Int(arc4random_uniform(10) + 1);

                } else {
                    resultLabel.textColor = UIColor.darkGrayColor();
                    resultLabel.text = "Nope, guess again.";
                    
                }
                
                
            }
            
            
        } else {
            
            resultLabel.textColor = UIColor.redColor();
            resultLabel.text = "That's not an integer!";
            
        }
        
        
    }
}
