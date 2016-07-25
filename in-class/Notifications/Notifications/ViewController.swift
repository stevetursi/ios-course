//
//  ViewController.swift
//  Notifications
//
//  Created by Lovey on 7/25/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

let ColorChangeNotification = "ColorChangeNotification"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.colorChangeNotificationFired(_:)), name: ColorChangeNotification, object: nil)

    
    }
    
    @objc func colorChangeNotificationFired(notification: NSNotification) {
        if let color = notification.object as? UIColor {
            view.backgroundColor = color
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redButtonAction(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName(ColorChangeNotification, object: UIColor.redColor())
    }

    @IBAction func blueButtonAction(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName(ColorChangeNotification, object: UIColor.blueColor())
    }

    
    @IBAction func greenButtonAction(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(ColorChangeNotification, object: UIColor.greenColor())
    }
    
}

