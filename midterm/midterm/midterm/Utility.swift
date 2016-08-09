//
//  Utility.swift
//  midterm
//
//  Created by Steven Tursi on 8/9/16.
//  Copyright © 2016 steve. All rights reserved.
//

import Foundation

class Utility {
    
    class func priceReadable(priceRaw: Int) -> String {
        return "$" + String(format: "%.2f", Float(priceRaw)/100)
    }
    
    class func totals(cart: [String:Int], catalog: [String:Int]) -> (Int, Int) {
        
        let totalQty = cart.values.reduce(0, combine: +)
        let totalPrice = cart.keys.reduce(0, combine: { $0 + (cart[$1] ?? 0) * (catalog[$1] ?? 0) })

        return (totalQty, totalPrice)
        
    }
}