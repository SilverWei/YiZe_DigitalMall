//
//  UserCollertTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/14.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class UserCollertTableViewController: UITableViewController {
    
    var UserCollectAll:[GetLikeGoods]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UserCollectGoodsRefresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func UserCollectGoodsRefresh(){
        UserCollectAll = GetLikeGoodsOut((NSUserDefaults.standardUserDefaults().valueForKey("UserID")) as! String)
        self.tableView.reloadData()
    }
    
    @IBAction func CloseViewButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCollectCellView", forIndexPath: indexPath) as! SearchGoodsCell
        
        let GoodsInfo:GetGoodsInfo = GoodsInfoOut(UserCollectAll![indexPath.row].Like_ID!)!
        cell.GoodsName.text = GoodsInfo.Goods_Name
        cell.GoodsMarketPrice.attributedText = NSAttributedString(string: "￥" + GoodsInfo.Goods_MarketPrice!, attributes: [NSStrikethroughStyleAttributeName:1])
        cell.GoodsMemberPrice.text = "￥" + GoodsInfo.Goods_MemberPrice!
        cell.GoodsImage.image = GoodsInfo.Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: GoodsInfo.Goods_Image!)!)!) : nil
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "取消收藏"
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print("!")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(UserCollectAll?.count >= 1){
            return (UserCollectAll?.count)!
        }
        else{
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            let label = UILabel(frame: self.tableView.bounds)
            label.text = "没有收藏的商品"
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.lightGrayColor()
            self.tableView.backgroundView = label
            
        }
        return 0
    }

    //页面对外接口
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowGoodsInfo"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                NSUserDefaults.standardUserDefaults().setObject(UserCollectAll![indexPath.row].Like_ID!, forKey: "GoodsInfoId")
                NSNotificationCenter.defaultCenter().postNotificationName("GoodsInfoView", object: nil)
            }
        }
    }
}
