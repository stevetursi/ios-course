//
//  VehicleViewController.swift
//  CarDealer
//
//  Created by Lovey on 7/13/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController {

    @IBOutlet var priceLabel: UILabel!
    var vehicle: Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let vehicle = vehicle {
            priceLabel.text = "\(vehicle.price)"
        } else {
            priceLabel.text = "Price not available"
        }
    
    }

}
