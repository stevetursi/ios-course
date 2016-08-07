//
//  AddViewController.swift
//  midterm
//
//  Created by Lovey on 8/7/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

protocol SelectItemDelegate {
    func getItem() -> String?
}

class AddViewController: UIViewController {
    
    private var catalog: [String: Int]?
    private var itemPrice: Int?
    
    var delegate: SelectItemDelegate?
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let itemName = delegate?.getItem() {
            itemNameLabel.text = itemName
            if let itemPrice = catalog![itemName] {
                self.itemPrice = itemPrice;
                itemPriceLabel.text = priceReadable(itemPrice)

                updatePrice()
            }
            
        } else {
            // handle the error
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func priceReadable(priceRaw: Int) -> String {
        return "$" + String(format: "%.2f", Float(priceRaw)/100)
    }
    
    func updatePrice() {
        let qty = Int(quantityField.text!) ?? 0
        totalPriceLabel.text = priceReadable(itemPrice! * qty)
    }
    
    @IBAction func qtyChangedEvent(sender: AnyObject) {
        updatePrice()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let registerVc = segue.destinationViewController as? RegisterViewController {
            let qty = Int(quantityField.text!) ?? 0
            registerVc.addItem(delegate!.getItem()!, qty: qty)
        }
    }

}

extension AddViewController: HasCatalog {
    func getCatalog() -> [String : Int] {
        return catalog!
    }
    func setCatalog(catalog: [String : Int]) {
        self.catalog = catalog
    }
}
