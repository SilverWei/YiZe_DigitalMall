//
//  UserInfoTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/8.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class UserInfoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if(NSUserDefaults.standardUserDefaults().valueForKey("UserID") != nil)
        {
            UserInfo()
            
            //建立刷新通知
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotif:", name: "ReloadUserInfoView", object: nil)
        }
    }
    
    func receivedNotif(notification:NSNotification){
        UserInfo()
        tableView.setContentOffset(CGPointMake(0, 0), animated: false)
    }

    func UserInfo(){
        let UserInfo = GetUserInfo(NSUserDefaults.standardUserDefaults().valueForKey("UserID") as! String)
        let cell = tableView.self as! UserInfoCell
        cell.User_Name.text = UserInfo?.User_Name
        cell.User_Mail.text = UserInfo?.User_Mail
        cell.User_Telephone.text = UserInfo?.User_Telephone
        cell.User_Address.text = UserInfo?.User_Address
        cell.User_RealName.text = UserInfo?.User_RealName
        cell.User_Grade.text = UserInfo?.User_Grade
        cell.User_Integral.text = UserInfo?.User_Integral
        cell.User_Image.image = UserInfo!.User_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: UserInfo!.User_Image!)!)!) : nil
        cell.User_Image.layer.masksToBounds = true
        cell.User_Image.layer.cornerRadius = 32

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
            return 1
        }
        if(section == 1){
            return 6
        }
        if(section == 2){
            return 2
        }
        if(section == 3){
            return 1
        }
        if(section == 4){
            return 1
        }
        else{
            return 0
        }
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
