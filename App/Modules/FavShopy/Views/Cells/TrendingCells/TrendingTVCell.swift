//
//  TrendingTVCell.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 27/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

class TrendingTVCell: UITableViewCell {

    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var AdImage: ScaledHeightImageView!
    
    @IBOutlet weak var shareBtn: AppButtonIcon!
    @IBOutlet weak var arBtn: AppButtonIcon!
    @IBOutlet weak var likeBtn: AppButtonIcon!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


