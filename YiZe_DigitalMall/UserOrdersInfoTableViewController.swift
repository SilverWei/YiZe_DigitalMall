//
//  UserOrdersInfoTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/16.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class UserOrdersInfoTableViewController: UITableViewController {

    var UserOrder_Id:String = ""
    
    var UserOrdersInfo:UserOrders?
    var UserOrdersGoodsAll = [UserOrdersGoods]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        UserOrderShow()
        self.tableView.reloadData()
    }
    
    func UserOrderShow(){
        UserOrdersInfo = GetUserOrdersInfoOut(NSUserDefaults.standardUserDefaults().valueForKey("UserID") as! String, Orders_ID: UserOrder_Id)
        UserOrdersGoodsAll = GetUserOrdersGoodsOut(NSUserDefaults.standardUserDefaults().valueForKey("UserID") as! String)!
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        if(section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("UserOrdersInfoCellView", forIndexPath: indexPath) as! UserOrdersInfoCell
            if(indexPath.row == 0){
                cell.CellLeft.text = "订单ID"
                cell.CellRight.text = UserOrdersInfo?.Order_ID
            }
            else if(indexPath.row == 1){
                cell.CellLeft.text = "订货时间"
                cell.CellRight.text = UserOrdersInfo?.Order_Time
            }
            else if(indexPath.row == 2){
                cell.CellLeft.text = "订单状态"
                cell.CellRight.text = UserOrdersInfo?.Order_State
            }
            else if(indexPath.row == 3){
                cell.CellLeft.text = "付款方法"
                cell.CellRight.text = UserOrdersInfo?.PaymentMethod
            }
            else if(indexPath.row == 4){
                cell.CellLeft.text = "收货人姓名"
                cell.CellRight.text = UserOrdersInfo?.ConsigneeName
            }
            else if(indexPath.row == 5){
                cell.CellLeft.text = "收货人地址"
                cell.CellRight.text = UserOrdersInfo?.ConsigneeAddress
            }
            else if(indexPath.row == 6){
                cell.CellLeft.text = "收货人手机"
                cell.CellRight.text = UserOrdersInfo?.ConsigneeTelephone
            }
            else if(indexPath.row == 7){
                cell.CellLeft.text = "收货人邮编"
                cell.CellRight.text = UserOrdersInfo?.ConsigneeZipCode
            }
            else if(indexPath.row == 8){
                cell.CellLeft.text = "交货方式"
                cell.CellRight.text = UserOrdersInfo?.DeliveryMode
            }
            else if(indexPath.row == 9){
                cell.CellLeft.text = "订单备注"
                cell.CellRight.text = UserOrdersInfo?.Order_Spare1
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCellWithIdentifier("UserOrdersGoodsCellView", forIndexPath: indexPath) as! SearchGoodsCell
            cell.GoodsName.text = UserOrdersGoodsAll[indexPath.row].Goods_Name
            cell.GoodsMarketPrice.text = ""
            cell.GoodsMemberPrice.text = "￥" + UserOrdersGoodsAll[indexPath.row].Goods_MemberPrice!
            cell.GoodsImage.image = UserOrdersGoodsAll[indexPath.row].Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: UserOrdersGoodsAll[indexPath.row].Goods_Image!)!)!) : nil
            return cell
        }

    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = indexPath.section
        
        if(section == 0){
            return 44
        }
        else{
            return 105
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "订单详情"
        }
        if(section == 1){
            return "订单商品"
        }
        else{
            return nil
        }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
            return 10
        }
        else{
            return UserOrdersGoodsAll.count
        }
    }

    //页面对外接口
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowGoodsInfo"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                NSUserDefaults.standardUserDefaults().setObject(UserOrdersGoodsAll[indexPath.row].Goods_ID, forKey: "GoodsInfoId")
                NSNotificationCenter.defaultCenter().postNotificationName("GoodsInfoView", object: nil)
            }
        }
    }
}
