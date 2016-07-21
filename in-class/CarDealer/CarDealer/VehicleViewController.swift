//
//  VehicleViewController.swift
//  CarDealer
//
//  Created by Lovey on 7/13/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

protocol CarWasDeletedDelegate: class {
    func deleteCar(car: Vehicle)
}


class VehicleViewController: UIViewController {

    var delegate: CarWasDeletedDelegate?
    @IBOutlet var priceLabel: UILabel!
    var vehicle: Vehicle?
    
    @IBAction func deleteButtonClicked(sender: UIBarButtonItem) {
    
        guard let vehicle = vehicle else {
            navigationController?.popViewControllerAnimated(true)
            return
        }
        delegate?.deleteCar(vehicle)
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let vehicle = vehicle {
            priceLabel.text = "\(vehicle.price)"
        } else {
            priceLabel.text = "Price not available"
        }
    
    }

}
