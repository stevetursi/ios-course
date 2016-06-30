//
//  ViewController.swift
//  RegForm
//
//  Created by Lovey on 6/29/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var user1: UITextField!
    @IBOutlet weak var user2: UITextField!
    @IBOutlet weak var pass1: UITextField!
    @IBOutlet weak var pass2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func preValidate(sender: AnyObject) {
        
        if(user1.text != user2.text) {
            resultLabel.text = "Usernames don't match"
        } else if (pass1.text != pass2.text) {
            resultLabel.text = "Passwords don't match"
        } else if(user1.text?.characters.count < 4) {
            resultLabel.text = "username is too short"
        } else {
            resultLabel.text = "Account created."
        }
        
        
    }

}

