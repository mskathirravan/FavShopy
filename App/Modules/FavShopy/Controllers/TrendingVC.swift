//
//  TrendingVC.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 27/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

class TrendingVC: BaseVC {

    // Ui IBOutlet
    @IBOutlet weak var tableView: UITableView!
   
    // Cell Identifier
    private let cellId = "TrendingTVCell"
    
    // Mark :- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TrendingVC: -> viewDidLoad")
       tableViewSetup()
    }
    
    // Mark :- tableView Setup
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "TrendingTVCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
}

// Mark :- tableView extension
extension TrendingVC: UITableViewDelegate,UITableViewDataSource {
    
    // tableview numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // tableview cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TrendingTVCell
        let random = Int.random(in: 1 ... 4)
        cell.AdImage.image  = UIImage(named: "model\(random)")
        return cell
    }

    // tableview heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    // tableview willDisplay
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
}
