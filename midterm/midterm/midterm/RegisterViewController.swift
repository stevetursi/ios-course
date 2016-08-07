//
//  RegisterViewController.swift
//  midterm
//
//  Created by Lovey on 8/7/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

protocol ItemWasAddedDelegate {
    func addItem(name: String, qty: Int)
}

class RegisterViewController: UITableViewController {
    
    let catalog: [String: Int] =
        ["Thing": 999, "Doo-Dad": 499, "Whatchamacallit": 2000, "Widget": 99, "Contraption": 1599, "Doohicky": 397]
    
    var cart: [String: Int] = [:]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        cart["Thing"] = 2;
        cart["Widget"] = 1;
        cart["Contraption"] = 4;
    
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartLine", forIndexPath: indexPath)
        let key = (Array(cart.keys))[indexPath.row]
        let qty = cart[key]
        
        cell.textLabel?.text = "\(key) - \(qty)"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let catalogvc = segue.destinationViewController as? HasCatalog {
            catalogvc.setCatalog(catalog);
        }
    }
}

extension RegisterViewController: ItemWasAddedDelegate {
    func addItem(name: String, qty: Int) {
        cart[name] = (cart[name] ?? 0) + qty
        tableView.reloadData()
    }
}
