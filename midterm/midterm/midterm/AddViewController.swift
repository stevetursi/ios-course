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
    var delegate: SelectItemDelegate?

    @IBOutlet weak var itemNameLabel: UILabel!

    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let itemName = delegate?.getItem() {
            itemNameLabel.text = itemName
            if let itemPrice = catalog![itemName] {
                itemPriceLabel.text = priceReadable(itemPrice)
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

}

extension AddViewController: HasCatalog {
    func getCatalog() -> [String : Int] {
        return catalog!
    }
    func setCatalog(catalog: [String : Int]) {
        self.catalog = catalog
    }
}
