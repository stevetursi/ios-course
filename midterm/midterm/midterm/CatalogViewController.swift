
import UIKit

protocol HasCatalog {
    func getCatalog() -> [String: Int]
    func setCatalog(catalog: [String: Int])
}



class CatalogViewController: UIViewController {
    
    private var cart: [String: Int] = [:]

    private var catalog: [String: Int] = [:]
    var selectedItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sender = sender as? UIButton
        selectedItem = sender?.currentTitle
        if let addVc = segue.destinationViewController as? AddViewController {
            addVc.delegate = self
            addVc.setCatalog(catalog)
            addVc.setCart(cart)
        }
    }
    
}

extension CatalogViewController: HasCatalog {
    func getCatalog() -> [String : Int] {
        return catalog
    }
    func setCatalog(catalog: [String : Int]) {
        self.catalog = catalog
    }
}

extension CatalogViewController: SelectItemDelegate {
    func getItem() -> String? {
        return selectedItem
    }
}

extension CatalogViewController: HasCart {
    func getCart() -> [String: Int] {
        return cart
    }
    func setCart(cart: [String: Int]) {
        self.cart = cart
    }
}
