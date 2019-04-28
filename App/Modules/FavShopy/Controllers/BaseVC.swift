//
//  BaseVC.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 27/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabbarSetup()
    }
    
    func tabbarSetup() {
        self.tabBarController?.navigationItem.title = self.title
        self.tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.tabBarController?.tabBar.layer.shadowRadius = 5
        self.tabBarController?.tabBar.layer.shadowOpacity = 1
        self.tabBarController?.tabBar.layer.masksToBounds = false
    }

}
