//
//  InVoiceVC.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 28/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

class InVoiceVC: UIViewController {
    
    
    // sharing the appdelegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var currentOptionSelected = 0
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalAmount: UILabel!
    
    
    @IBOutlet weak var option1Btn: UIButton!
    
    @IBOutlet weak var option2Btn: UIButton!
    
    
    @IBAction func option1BtnAction(_ sender: UIButton) {
        if currentOptionSelected == sender.tag {
            currentOptionSelected = 1
            option1Btn.setImage(UIImage(named: "Checkmark"), for: .normal)
            option2Btn.setImage(UIImage(named: "Checkmarkempty"), for: .normal)
        }else{
            currentOptionSelected = 0
            option1Btn.setImage(UIImage(named: "Checkmarkempty"), for: .normal)
             option2Btn.setImage(UIImage(named: "Checkmark"), for: .normal)
        }
    }
    
    @IBAction func option2BtnAction(_ sender: UIButton) {
        if currentOptionSelected == sender.tag {
            currentOptionSelected = 1
            option2Btn.setImage(UIImage(named: "Checkmark"), for: .normal)
            option1Btn.setImage(UIImage(named: "Checkmarkempty"), for: .normal)
        }else{
            currentOptionSelected = 0
            option2Btn.setImage(UIImage(named: "Checkmarkempty"), for: .normal)
            option1Btn.setImage(UIImage(named: "Checkmark"), for: .normal)
        }
        
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Message", message: "Thank you visit again", preferredStyle: .alert)
        
        // Create OK button
        let OKAction = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            self.appDelegate.window?.rootViewController = ContainerViewController()
            
        }
        alertController.addAction(OKAction)
        // Present Dialog message
        self.present(alertController, animated: true, completion:nil)
        
    }
    
    // Cell Identifier
    private let cellId = "TrendingTVCell"
    private let headerId = "ProductHeaderTVCell"
    
    // product variables
    var productList = [ProductModel]()
    var totalAmt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        self.totalAmount.text = "\(totalAmt)"
    }

    
    // tableView Setup
    func tableViewSetup() {
        let headerNib = UINib.init(nibName: "ProductHeaderTVCell", bundle: Bundle.main)
        tableView.delegate = self
        tableView.dataSource = self
        // tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ProductItemTVCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: headerId)
    }
}
// Mark :- tableView extension
extension InVoiceVC: UITableViewDelegate,UITableViewDataSource {
    
    
    // tableview heightForHeaderInSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    // tableview viewForHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! ProductHeaderTVCell
        return headerView
    }
    
    
    // tableview numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    // tableview cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = productList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductItemTVCell
        cell.sNo.text = "\(indexPath.row+1)."
        cell.itemtxt.text  = row.name
        cell.itemPrice.text = "\(row.price)"
        return cell
    }
    
    // tableview heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // tableview willDisplay
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
