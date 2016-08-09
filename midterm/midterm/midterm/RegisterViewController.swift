

import UIKit

class RegisterViewController: UITableViewController {
    
    let catalog: [String: Int] =
        ["Thing": 999, "Doo-Dad": 499, "Whatchamacallit": 2000, "Widget": 99, "Contraption": 1599, "Doohicky": 397]
    
    private var cart: [String: Int] = [:]


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count+1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        if let cell = tableView.dequeueReusableCellWithIdentifier("CartLine", forIndexPath: indexPath) as? CartItemTableViewCell {
            if row < cart.count {
                let key = (Array(cart.keys))[row]
                let qty = cart[key]!
            
                let price = Utility.priceReadable(qty*(catalog[key] ?? 0))
        
                cell.nameLabel?.text = "\(key)"
                cell.qtyLabel?.text = "\(qty)"
                cell.priceLabel?.text = "\(price)"
                return cell
            } else {
                let (totalQty, totalPrice) = Utility.totals(cart, catalog: self.catalog)
                
                cell.backgroundColor = UIColor.blackColor()
                cell.nameLabel?.text = "TOTAL"
                cell.nameLabel?.textColor = UIColor.whiteColor()
                cell.qtyLabel?.text = "\(totalQty)"
                cell.qtyLabel?.textColor = UIColor.whiteColor()
                cell.priceLabel?.text = "\(Utility.priceReadable(totalPrice))"
                cell.priceLabel?.textColor = UIColor.whiteColor()
                
            }
        }
        return tableView.dequeueReusableCellWithIdentifier("CartLine", forIndexPath: indexPath)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let catalogvc = segue.destinationViewController as? HasCatalog {
            catalogvc.setCatalog(catalog);
        }
        if let cartvc = segue.destinationViewController as? HasCart {
            cartvc.setCart(cart);
        }
    }
}

extension RegisterViewController: HasCart {
    func getCart() -> [String: Int] {
        return cart
    }
    func setCart(cart: [String: Int]) {
        self.cart = cart
    }
}
