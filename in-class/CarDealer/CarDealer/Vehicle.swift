//
//  Vehicle.swift
//  CarDealer
//
//  Created by Lovey on 7/13/16.
//  Copyright © 2016 steve. All rights reserved.
//

import Foundation


class Vehicle :NSObject, NSCoding {
    
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
    
    required init?(coder decoder: NSCoder) {
        if
            let make = decoder.decodeObjectForKey("vehicle_make") as? String,
            let model = decoder.decodeObjectForKey("vehicle_model") as? String,
            let year = decoder.decodeObjectForKey("vehicle_year") as? Int,
            let price = decoder.decodeObjectForKey("vehicle_price") as? Double
        {
            self.make = make;
            self.model = model;
            self.year = year;
            self.price = price;
        } else {
            return nil
        }
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(make, forKey:"vehicle_make")
        aCoder.encodeObject(model, forKey:"vehicle_model")
        aCoder.encodeObject(year, forKey:"vehicle_year")
        aCoder.encodeObject(price, forKey:"vehicle_price")
    }
    
}