//
//  FavShopyTheme.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 27/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

struct FavShopyTheme: Theme {
    let tint: UIColor = UIColor(hexString: "#498E36")
    let secondaryTint: UIColor = UIColor(hexString: "#EBECF5")
    
    let backgroundColor: UIColor = .white
    let separatorColor: UIColor = .lightGray
    let selectionColor: UIColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
    
    let labelColor: UIColor = UIColor(hexString: "#0C0C0C")
    let secondaryLabelColor: UIColor = .darkGray
    let subtleLabelColor: UIColor =  UIColor(hexString: "#0C0C0C")
    
    
    
    let barStyle: UIBarStyle = .default
}

extension FavShopyTheme {
    
    func extend() {
//        UIImageView.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).with {
//            $0.borderColor = separatorColor
//            $0.borderWidth = 1
//        }
//        
//        UIImageView.appearance(whenContainedInInstancesOf: [UIButton.self, UITableViewCell.self]).with {
//            $0.borderWidth = 0
//        }
    }
}
