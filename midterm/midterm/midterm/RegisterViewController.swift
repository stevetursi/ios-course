//
//  RegisterViewController.swift
//  midterm
//
//  Created by Lovey on 8/7/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class RegisterViewController: UITableViewController {
    
    let catalog: [String: Int] =
        ["Thing": 999, "Doo-Dad": 499, "Whatchamacallit": 2000, "Widget": 99, "Contraption": 1599, "Doohicky": 397]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let catalogvc = segue.destinationViewController as? HasCatalog {
            catalogvc.setCatalog(catalog);
        }
    }
}
