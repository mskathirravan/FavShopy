//
//  HomeTabbarVC.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 28/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit

class HomeTabbarVC: UITabBarController {
    
    
    @IBAction func menuBtnAction(_ sender: Any) {
        slideMenudelegate?.toggleLeftPanel?()
        
    }
    
    @IBAction func QrBtnAction(_ sender: Any) {
        appDelegate.window?.addSubview(VC.view)
        VC.closeBtn.isHidden = false
    }
    
    
    // sharing the appdelegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var slideMenudelegate: CenterViewControllerDelegate?
    
    var VC: QrScannerVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard: UIStoryboard = UIStoryboard(name: "FavShopy", bundle: nil)
        VC = storyboard.instantiateViewController(withIdentifier: "QrScannerVC") as? QrScannerVC
        VC.view.tag = 501
        VC.view.frame = appDelegate.window!.frame
        appDelegate.window?.addSubview(VC.view)
//        self.addChild(VC)
    }
    
    @objc func ItemTapped(){
        VC?.closeBtn.isHidden = false
        appDelegate.window?.addSubview(VC.view)
    }
}

// MARK: - SidePanelViewControllerDelegate
extension HomeTabbarVC: SidePanelViewControllerDelegate {

}

