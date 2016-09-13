//
//  ViewController.swift
//  CarDealer
//
//  Created by Lovey on 7/13/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class DealerTableViewController: UITableViewController {
    
    let baseURL = "http://loveys-macbook-pro.local:8091/inventory"
    var model: [Vehicle] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if
            let data = NSData(contentsOfURL: self.inventoryFileUrl()),
            let inventory = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Vehicle]
        {
            print("LOADED FROM DOCUMENT DIRECTORY")
            self.model = inventory
        } else {
            print("LOAD HARDCODED DATA")
            self.model = [
                Vehicle(make: "Honda", model: "Civic", year: 2014, price: 12345.67),
                Vehicle(make: "Ford", model: "Focus", year: 2015, price: 11234.98),
                Vehicle(make: "Chevy", model: "Volt", year: 2016, price:   21345.21)
            ]
        }
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(DealerTableViewController.willResignActiveNotification(_:)),
            name: UIApplicationWillResignActiveNotification,
            object: nil)
        
    }
    
    func willResignActiveNotification(sender: NSNotification) {
        print("SAVING TO DOCUMENT DIRECTORY")
        let data = NSKeyedArchiver.archivedDataWithRootObject(self.model)
        data.writeToURL(self.inventoryFileUrl(), atomically: true)
    }
    
    private func inventoryFileUrl() -> NSURL {
        let dirUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        return dirUrl.URLByAppendingPathComponent("inventory.ser")
    }

    @IBAction func addButtonAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "AddCar", bundle: nil)
        
        if let addNavController =
            storyboard.instantiateViewControllerWithIdentifier("AddNavController") as? UINavigationController,
            let addViewController = addNavController.topViewController as? AddNavController {
        
                addViewController.delegate = self
            presentViewController(addNavController, animated: true) {
                print("FINISHED")
            }
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vvc = segue.destinationViewController as? VehicleViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let thisVehicle = model[indexPath.row]
                vvc.vehicle = thisVehicle;
                vvc.delegate = self;
            }
            
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CarIdentifier", forIndexPath: indexPath)
        let dataObject = model[indexPath.row]
        cell.textLabel?.text = ("\(dataObject.year) \(dataObject.make) \(dataObject.model)");
        cell.detailTextLabel?.text = String(dataObject.price);
        
        return cell
    }

}

extension DealerTableViewController: CarWasAddedDelegate {
    func addCar(car: Vehicle) {
        print("VEHICLE WAS ADDED")
        model.append(car)
        tableView.reloadData()
        
    }
    
}

extension DealerTableViewController: CarWasDeletedDelegate {
    func deleteCar(car: Vehicle) {
        print("VEHICLE WAS DELETED")
        if let indexPath = tableView.indexPathForSelectedRow {
            model.removeAtIndex(indexPath.row)
        }
        
        
        tableView.reloadData()
    }
}
