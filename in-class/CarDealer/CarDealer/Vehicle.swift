//
//  Vehicle.swift
//  CarDealer
//
//  Created by Lovey on 7/13/16.
//  Copyright © 2016 steve. All rights reserved.
//

import Foundation


class Vehicle {
    
    let make: String
    let model: String
    let year: Int
    let price: Double
    
    init(make: String, model: String, year: Int, price: Double) {
        self.make = make;
        self.model = model;
        self.year = year;
        self.price = price;
    }
    
}