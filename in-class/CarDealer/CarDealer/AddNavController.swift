//
//  AddNavController.swift
//  CarDealer
//
//  Created by Lovey on 7/18/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

protocol CarWasAddedDelegate {
    func addCar(car: Vehicle)
}


class AddNavController: UIViewController {
    
    var delegate: CarWasAddedDelegate?
    
    @IBAction func addButtonAction(sender: AnyObject) {
        let car = Vehicle(make: "Honda", model: "Civic", year: 2014, price: 12345.67);
        delegate?.addCar(car)
        print("ADD BUTTON CLICKED")
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func cancelButtonAction(sender: AnyObject) {
        print("CANCEL BUTTON CLICKED")
        dismissViewControllerAnimated(true, completion: nil)
    }
}
