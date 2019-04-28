//
//  ProductItemTVCell.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 27/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

class ProductItemTVCell: UITableViewCell {
    
    
    @IBOutlet weak var sNo: UILabel!
    @IBOutlet weak var itemtxt: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
