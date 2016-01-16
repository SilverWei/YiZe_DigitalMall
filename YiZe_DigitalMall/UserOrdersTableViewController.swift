//
//  UserOrdersTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/8.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

/**
*　　　　　　　　┏┓　　　┏┓+ +
*　　　　　　　┏┛┻━━━┛┻┓ + +
*　　　　　　　┃　　　　　　　┃
*　　　　　　　┃　　　━　　　┃ ++ + + +
*　　　　　　 ████━████ ┃+
*　　　　　　　┃　　　　　　　┃ +
*　　　　　　　┃　　　┻　　　┃
*　　　　　　　┃　　　　　　　┃ + +
*　　　　　　　┗━┓　　　┏━┛
*　　　　　　　　　┃　　　┃
*　　　　　　　　　┃　　　┃ + + + +
*　　　　　　　　　┃　　　┃　　　　Code is far away from bug with the animal protecting
*　　　　　　　　　┃　　　┃ + 　　　　神兽保佑,代码无bug
*　　　　　　　　　┃　　　┃
*　　　　　　　　　┃　　　┃　　+
*　　　　　　　　　┃　 　　┗━━━┓ + +
*　　　　　　　　　┃ 　　　　　　　┣┓
*　　　　　　　　　┃ 　　　　　　　┏┛
*　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
*　　　　　　　　　　┃┫┫　┃┫┫
*　　　　　　　　　　┗┻┛　┗┻┛+ + + +

*/

import UIKit

class UserOrdersTableViewController: UITableViewController {
    
    var UserOrdersAll:[UserOrders]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserOrderShow()
        self.tableView.reloadData()
    }
    
    func UserOrderShow(){
        UserOrdersAll = GetUserOrdersOut(NSUserDefaults.standardUserDefaults().valueForKey("UserID") as! String)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CloseViewButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let cell = tableView.dequeueReusableCellWithIdentifier("UserOrdersCellView", forIndexPath: indexPath) as! UserOrdersCell
        
        cell.Order_ID.text = "订单ID：" + UserOrdersAll![section].Order_ID!
        cell.Order_Time.text = UserOrdersAll![section].Order_Time
        cell.Order_State.text = UserOrdersAll![section].Order_State
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        if(UserOrdersAll?.count >= 1){
            return (UserOrdersAll?.count)!
        }
        
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(UserOrdersAll?.count >= 1){
            self.tableView.backgroundView = nil
            return 1
        }
        else{
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            let label = UILabel(frame: self.tableView.bounds)
            label.text = "没有相关订单"
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.lightGrayColor()
            self.tableView.backgroundView = label
            
        }
        return 0
    }

    //页面对外接口
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UserOrderInfo"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let section = indexPath.section
                (segue.destinationViewController as! UserOrdersInfoTableViewController).UserOrder_Id = UserOrdersAll![section].Order_ID!
            }
        }
    }

}
