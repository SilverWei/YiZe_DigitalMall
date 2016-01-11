//
//  RegisteredTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class RegisteredTableViewController: UITableViewController {

    @IBOutlet var UserName: UITextField!
    @IBOutlet var UserPassword: UITextField!
    @IBOutlet var UserRepeatPassword: UITextField!
    @IBOutlet var UserMail: UITextField!
    @IBOutlet var UserTelephone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBAction func RegisteredIn(sender: AnyObject) {
        
        if(UserName.text == "" || UserPassword.text == "" || UserMail.text == "" || UserTelephone.text == ""){
            ProgressHUD.showError("数据不能为空")
        }
        else{
            if(UserPassword.text == UserRepeatPassword.text)
            {
                let UserregisterOut = UserRegister(UserInfo.UserRegisterIn(User_Name: UserName.text, User_Password: UserPassword.text, User_Maill: UserMail.text, User_Telephone: UserTelephone.text))
                if(UserregisterOut != nil){
                    if(UserregisterOut?.Code == 4){
                        NSUserDefaults.standardUserDefaults().setObject(UserregisterOut?.User_ID, forKey: "UserID")
                        self.dismissViewControllerAnimated(true, completion: nil)
                        ProgressHUD.showSuccess("注册完成")
                    }
                    else{
                        ProgressHUD.showError("注册失败，可能此用户名已被使用或其他信息有误")
                    }
                }
                else{
                    ProgressHUD.showError("连接超时")
                }
            }
            else{
                ProgressHUD.showError("重复密码不一致")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    @IBAction func CloseViewButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
