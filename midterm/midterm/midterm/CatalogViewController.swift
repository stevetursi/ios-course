//
//  CatalogViewController.swift
//  midterm
//
//  Created by Lovey on 8/7/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

protocol HasCatalog {
    func getCatalog() -> [String: Int]
    func setCatalog(catalog: [String: Int])
}

class CatalogViewController: UIViewController {

    private var catalog: [String: Int]?
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
            addVc.setCatalog(catalog!)
        }
    }
    
}

extension CatalogViewController: HasCatalog {
    func getCatalog() -> [String : Int] {
        return catalog!
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
