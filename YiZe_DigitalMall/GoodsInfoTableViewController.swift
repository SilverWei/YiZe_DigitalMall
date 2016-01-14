//
//  GoodsInfoTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/13.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class GoodsInfoTableViewController: UITableViewController {


    @IBOutlet var Goods_Name: UILabel!
    @IBOutlet var Goods_MarketPrice: UILabel!
    @IBOutlet var Goods_MemberPrice: UILabel!
    @IBOutlet var Goods_Image: UIImageView!
    @IBOutlet var Goods_Introduction: UITextView!
    @IBOutlet var Goods_Sort: UILabel!
    @IBOutlet var Goods_InventoryNumber: UILabel!
    @IBOutlet var Goods_Time: UILabel!
    @IBOutlet var Goods_PurchaseIntegral: UILabel!
    
    @IBOutlet var CollectButton: MKButton!  
    @IBOutlet var UnCollectButton: MKButton!
    @IBOutlet var AddToCart: MKButton!
    
    var GoodsInfoId:String = ""
    var GoodsInfo:GetGoodsInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectButton.layer.shadowOpacity = 0.55
        CollectButton.layer.shadowRadius = 5.0
        CollectButton.layer.shadowColor = UIColor.grayColor().CGColor
        CollectButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        
        AddToCart.layer.shadowOpacity = 0.55
        AddToCart.layer.shadowRadius = 5.0
        AddToCart.layer.shadowColor = UIColor.grayColor().CGColor
        AddToCart.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        
        
        //建立刷新通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotif:", name: "GoodsInfoView", object: nil)
        
        GoodsInfoGet()
    }
    
    func receivedNotif(notification:NSNotification){
        GoodsInfoGet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ShoppingCartClick(sender: AnyObject) {
        
        if(NSUserDefaults.standardUserDefaults().valueForKey("ShoopingCart") == nil){
            let ShoppingCartAll:[AnyObject!] = []
            
            NSUserDefaults.standardUserDefaults().setObject(ShoppingCartAll, forKey: "ShoopingCart")
        }
        
        ///////////////////////////////////////////////
        ///////////////////////////////////////////////
        ///////////////////////////////////////////////
        ///////////////////////////////////////////////
        ///////////////////////////////////////////////
    }
    


    @IBAction func CloseViewButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func GoodsInfoGet(){
        GoodsInfoId = NSUserDefaults.standardUserDefaults().valueForKey("GoodsInfoId") as! String
        GoodsInfo = GoodsInfoOut(GoodsInfoId)
        if(GoodsInfo != nil){
            Goods_Name.text = GoodsInfo?.Goods_Name
            Goods_MarketPrice.attributedText = NSAttributedString(string: "￥" + GoodsInfo!.Goods_MarketPrice!, attributes: [NSStrikethroughStyleAttributeName:1])
            Goods_MemberPrice.text = "￥" + GoodsInfo!.Goods_MemberPrice!
            Goods_Image.image = GoodsInfo!.Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: GoodsInfo!.Goods_Image!)!)!) : nil
            let htmlString:NSString = (GoodsInfo?.Goods_Introduction)!
            let attributedString:NSAttributedString = try! NSAttributedString(data: htmlString.dataUsingEncoding(NSUnicodeStringEncoding)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            Goods_Introduction.attributedText = attributedString
            Goods_Sort.text = (GetSort1stName(GoodsInfo!.Goods_Sort1!))! + " -> " + GetSort2ndName((GoodsInfo?.Goods_Sort1)!, Sort2ndId: (GoodsInfo?.Goods_Sort2)!)!
            Goods_InventoryNumber.text = GoodsInfo?.Goods_InventoryNumber
            Goods_Time.text = GoodsInfo?.Goods_Time
            Goods_PurchaseIntegral.text = GoodsInfo?.Goods_PurchaseIntegral
            if((NSUserDefaults.standardUserDefaults().valueForKey("UserID")) != nil){
                if(LikeGoodsYesOrNo((NSUserDefaults.standardUserDefaults().valueForKey("UserID")) as! String, Goods_ID: GoodsInfoId) == 1){
                    CollectButton.hidden = true
                }
                else{
                    UnCollectButton.hidden = true
                }
            }
            else{
                UnCollectButton.hidden = true
            }

        }
        else{
            ProgressHUD.showError("连接超时")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
            return 2
        }
        if(section == 1){
            return 4
        }
        if(section == 2){
            return 1
        }
        else{
            return 0
        }
        
    }

}
