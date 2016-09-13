//
//  ViewController.swift
//  AppleData
//
//  Created by Steven Tursi on 8/15/16.
//  Copyright © 2016 Steven Tursi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let pc: ParentalContexts = ParentalContexts.init(momIdentifier: "hello")
    var contact: Contact?
    
    @IBOutlet weak var firstName: UITextField!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            let fetchRequest = NSFetchRequest(entityName: "Contact")
            self.contact =  try pc.mainManagedObjectContext.executeFetchRequest(fetchRequest).first as! Contact
        } catch {
            //error
        }
        
        
        if let contact = self.contact {
            firstName.text = contact.firstName
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func supDate(sender: AnyObject) {
        
        contact?.firstName = firstName.text

        let managedObjectContext = pc.mainManagedObjectContext
        
        if let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: managedObjectContext) as? Contact {
            contact.firstName = firstName.text
            

        }
        pc.save();
        
    }

}

