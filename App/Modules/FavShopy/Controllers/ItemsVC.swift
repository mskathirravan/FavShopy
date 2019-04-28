//
//  ItemsVC.swift
//  myfavourites
//
//  Created by Prabhat Malhotra on 27/04/19.
//  Copyright © 2019 Kathir MS. All rights reserved.
//

import UIKit
import AVFoundation
import AWSPinpoint

class ItemsVC: BaseVC, AVCaptureMetadataOutputObjectsDelegate {


    // Ui IBOutlet
    @IBOutlet weak var cameraPreview: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalAmount: UILabel!
    
    // Cell Identifier
    private let cellId = "TrendingTVCell"
    private let headerId = "ProductHeaderTVCell"
    
    @IBAction func CheckoutBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Message", message: "Are you sure to checkout?", preferredStyle: .alert)
        
        // Create OK button
        let OKAction = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
            let storyboard: UIStoryboard = UIStoryboard(name: "FavShopy", bundle: nil)
            let VC = storyboard.instantiateViewController(withIdentifier: "InVoiceVC") as! InVoiceVC
            VC.totalAmt = self.totalAmt
            VC.productList = self.productList
            self.navigationController?.pushViewController(VC, animated: true)
            
        }
        alertController.addAction(OKAction)
        
        // Create Cancel button
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { (action:UIAlertAction!) in
            print("Cancel button tapped");
        }
        alertController.addAction(cancelAction)
        
        // Present Dialog message
        self.present(alertController, animated: true, completion:nil)
        
    }
    
    
    // camera variables
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    // product variables
    var productList = [ProductModel]()
    var totalAmt = 0
    
    // sharing the appdelegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var analyticsClient: AWSPinpointAnalyticsClient!
    var analyticsEvent:AWSPinpointEvent!
    
    // Mark :- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ItemsVC: -> viewDidLoad")
        analyticsClient = appDelegate.pinpoint?.analyticsClient
        analyticsEvent = analyticsClient.createEvent(withEventType: "ItemsScreen")
        totalAmount.text = "\(totalAmt)"
        barcodeScannerSetup()
        tableViewSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scannerStart()
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        scannerStop()
        if analyticsClient != nil {
            print("AWSanalytics: process")
            analyticsClient.record(analyticsEvent)
            analyticsClient.submitEvents()
        }
    }
    
    func barcodeScannerSetup() {
        
       // view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = cameraPreview.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        cameraPreview.layer.addSublayer(previewLayer)
        
       // captureSession.startRunning()
        scannerStart()

    }
    
    func scannerStart() {
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    func scannerStop() {
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
        AddProduct(barcode: code)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.scannerStart()
        })
        
    }
    
    // add product to the list
    func AddProduct(barcode: String) {
        let rprice = Int.random(in: 20 ..< 200)
        let strArray = ["Frodo", "sam", "wise", "gamgee"]
        let randomIndex = Int(arc4random_uniform(UInt32(strArray.count)))
        self.totalAmt = self.totalAmt+rprice
        self.totalAmount.text = "\(self.totalAmt)"
        productList.append(ProductModel(name: "\(strArray[randomIndex])", offer: "", price: rprice, pcount: 0))
        analyticsEvent.addAttribute("\(strArray[randomIndex])=\(rprice)", forKey: "item")
        analyticsEvent.addMetric(NSNumber(value: arc4random() % 65535), forKey: "EventName")
        self.tableView.reloadData()
        self.scrollToBottom()
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
    
    // tableView scrollToBottom
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.productList.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
}

// Mark :- tableView extension
extension ItemsVC: UITableViewDelegate,UITableViewDataSource {
    
    
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let row = indexPath.row
            let getprice =  productList[row].price
            productList.remove(at: row)
            self.totalAmt = self.totalAmt-getprice
            self.totalAmount.text = "\(self.totalAmt)"
            self.tableView.reloadData()
        }
    }
}
