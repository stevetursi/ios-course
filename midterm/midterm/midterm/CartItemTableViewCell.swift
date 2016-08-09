//
//  CartItemTableViewCell.swift
//  midterm
//
//  Created by Steven Tursi on 8/8/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
