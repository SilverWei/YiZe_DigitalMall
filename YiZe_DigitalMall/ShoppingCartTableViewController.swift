//
//  ShoppingCartTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class ShoppingCartTableViewController: UITableViewController {
    
    var ShoppingCartAll = [ShoppingCart]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ShoppingCartRefresh()
    }
    
    func ShoppingCartRefresh(){
        ShoppingCartAll = GetShoppingCart("20151210132034939045")!
        self.tableView.reloadData()
    }
    
    @IBAction func CloseViewButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func QuantityEditClick(sender: AnyObject) {
        print(sender.tag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = indexPath.section
        
        if(section == 0){
            return 105
        }
        else{
            return 44
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if(section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("ShoppingCartCellView", forIndexPath: indexPath) as! ShoppingCartCell
            
            let GoodsInfo:GetGoodsInfo = GoodsInfoOut(ShoppingCartAll[indexPath.row].Goods_ID!)!
            cell.GoodsName.text = GoodsInfo.Goods_Name
            cell.GoodsMemberPrice.text = "￥" + GoodsInfo.Goods_MemberPrice!
            cell.GoodsImage.image = GoodsInfo.Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: GoodsInfo.Goods_Image!)!)!) : nil
            cell.GoodsQuantity.text = ShoppingCartAll[indexPath.row].Goods_Quantity! + "个"
            cell.GoodsQuantityButton.tag = indexPath.row
            cell.GoodsQuantityButton.layer.shadowOpacity = 0.55
            cell.GoodsQuantityButton.layer.shadowRadius = 5.0
            cell.GoodsQuantityButton.layer.shadowColor = UIColor.grayColor().CGColor
            cell.GoodsQuantityButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCellWithIdentifier("ShoppingCartToOrderClick", forIndexPath: indexPath)
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "从购物车删除"
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print("!")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(ShoppingCartAll.count > 0){
            if(section == 0){ //购物车商品行数
                return ShoppingCartAll.count
            }
            else{
                return 1
            }
        }
        else{
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            let label = UILabel(frame: self.tableView.bounds)
            label.text = "没有商品放入购物车"
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
                NSUserDefaults.standardUserDefaults().setObject(ShoppingCartAll[indexPath.row].Goods_ID!, forKey: "GoodsInfoId")
                NSNotificationCenter.defaultCenter().postNotificationName("GoodsInfoView", object: nil)
            }
        }
    }

}
