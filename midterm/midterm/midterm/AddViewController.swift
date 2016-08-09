
import UIKit

protocol SelectItemDelegate {
    func getItem() -> String?
}

class AddViewController: UIViewController {
    
    
    private var cart: [String: Int] = [:]
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
            if let qty = cart[itemName] {
                quantityField.text = String(qty)
            }
            itemNameLabel.text = itemName
            if let itemPrice = catalog![itemName] {
                self.itemPrice = itemPrice;
                itemPriceLabel.text = Utility.priceReadable(itemPrice)

                updatePrice()
            }
            
        } else {
            // handle the error
        }
    }

    @IBAction func incrementQty(sender: AnyObject) {
        let qty = (Int(quantityField.text!) ?? 0)+1
        quantityField.text = String(qty)
        updatePrice()
    }
    
    @IBAction func decrementQty(sender: AnyObject) {
        var qty = (Int(quantityField.text!) ?? 0) - 1
        if qty < 0 {
            qty = 0
        }
        quantityField.text = String(qty)
        updatePrice()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updatePrice() {
        let qty = Int(quantityField.text!) ?? 0
        totalPriceLabel.text = Utility.priceReadable(itemPrice! * qty)
    }
    
    @IBAction func qtyChangedEvent(sender: AnyObject) {
        updatePrice()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let registerVc = segue.destinationViewController as? RegisterViewController {
            let qty = Int(quantityField.text!) ?? 0
            if let name = delegate!.getItem() {
                cart[name] = qty==0 ? nil : qty
            }
            registerVc.setCart(cart);
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
extension AddViewController: HasCart {
    func getCart() -> [String: Int] {
        return cart
    }
    func setCart(cart: [String: Int]) {
        self.cart = cart
    }
}
