//
//  CheckoutViewController.swift
//  midterm
//
//  Created by Steven Tursi on 8/9/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    private var catalog: [String: Int] = [:]
    private var cart: [String: Int] = [:]
    private var tax: Int = 0
    private var grandTotalPrice: Int = 0
    private var changeDue: Int = 0
    
    @IBOutlet weak var totalQtyLabel: UILabel!

    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var grandTotalPriceLabel: UILabel!
    
    @IBOutlet weak var payButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payButton.enabled = false;
   
        let (totalQty, totalPrice) = Utility.totals(cart, catalog: catalog)
        
        tax = Int(Float(totalPrice) * 0.085)
        grandTotalPrice = totalPrice + tax
        
        totalQtyLabel.text = "\(totalQty)"
        totalPriceLabel.text = "\(Utility.priceReadable(totalPrice))"
    
        taxLabel.text = "\(Utility.priceReadable(tax))"
        
        grandTotalPriceLabel.text = Utility.priceReadable(grandTotalPrice)
    }
    
    @IBAction func cashChanged(sender: UITextField) {
        if let rawInput = sender.text {
            if let inputFloat = Float(rawInput) {
                let cash = Int(inputFloat*100)
                if cash >= grandTotalPrice {
                    payButton.enabled = true
                    changeDue = cash - grandTotalPrice
                    return;
                }
            }
        }
        payButton.enabled = false
        changeDue = 0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cdvc = segue.destinationViewController as? ChangeDueViewController {
            cdvc.changeDue = changeDue
            cart = [:]
        }
    }
}

extension CheckoutViewController: HasCatalog {
    func getCatalog() -> [String : Int] {
        return catalog
    }
    func setCatalog(catalog: [String : Int]) {
        self.catalog = catalog
    }
}

extension CheckoutViewController: HasCart {
    func getCart() -> [String: Int] {
        return cart
    }
    func setCart(cart: [String: Int]) {
        self.cart = cart
    }
}