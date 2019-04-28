//
//  SubscribeVC.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 27/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

class SubscribeVC: BaseVC {
    
    // Ui IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // Cell Identifier
    private let cellId = "SubscribeTVcell"
    
    // Mark :- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SubscribeVC: -> viewDidLoad")
        tableViewSetup()
    }
    
    // Mark :- tableView Setup
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "SubscribeTVcell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
}

// Mark :- tableView extension
extension SubscribeVC: UITableViewDelegate,UITableViewDataSource {
    
    // tableview numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // tableview cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //   let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SubscribeTVcell
        
        
        
        return cell
    }
    
    // tableview heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // tableview willDisplay
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
