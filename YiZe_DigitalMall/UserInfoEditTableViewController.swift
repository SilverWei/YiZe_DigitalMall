//
//  UserInfoEditTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class UserInfoEditTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        UserInfoShow()
    }

    @IBAction func CloseViewButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func UserInfoEditSaveClick(sender: AnyObject) {
        let cell = tableView.self as! UserInfoEditCell
        let UpUserInfoOut = UpUserInfo(UserInfo.UpUserInfoIn(User_ID: (NSUserDefaults.standardUserDefaults().valueForKey("UserID") as! String), User_Mail: cell.User_Mail.text, User_Telephone: cell.User_Telephone.text, User_Address: cell.User_Address.text, User_RealName: cell.User_RealName.text))
        
        if(UpUserInfoOut?.Code == 100){
            ProgressHUD.showSuccess("修改成功")
            NSNotificationCenter.defaultCenter().postNotificationName("ReloadUserInfoView", object: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else{
            ProgressHUD.showError("修改有误")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UserInfoShow(){
        let UserInfo = GetUserInfo(NSUserDefaults.standardUserDefaults().valueForKey("UserID") as! String)
        if(UserInfo?.User_Name != nil){
            let cell = tableView.self as! UserInfoEditCell
            cell.User_Name.text = UserInfo?.User_Name
            cell.User_Mail.text = UserInfo?.User_Mail
            cell.User_Telephone.text = UserInfo?.User_Telephone
            cell.User_Address.text = UserInfo?.User_Address
            cell.User_RealName.text = UserInfo?.User_RealName
            cell.User_Image.image = UserInfo!.User_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: UserInfo!.User_Image!)!)!) : nil
            cell.User_Image.layer.masksToBounds = true
            cell.User_Image.layer.cornerRadius = 32
            
            cell.User_Mail.layer.borderColor = UIColor.clearColor().CGColor
            cell.User_Mail.tintColor = UIColor.MKColor.Blue
            cell.User_Mail.rippleLocation = .Right
            cell.User_Mail.cornerRadius = 0
            cell.User_Mail.bottomBorderEnabled = true
            
            cell.User_Telephone.layer.borderColor = UIColor.clearColor().CGColor
            cell.User_Telephone.tintColor = UIColor.MKColor.Blue
            cell.User_Telephone.rippleLocation = .Right
            cell.User_Telephone.cornerRadius = 0
            cell.User_Telephone.bottomBorderEnabled = true
            
            cell.User_Address.layer.borderColor = UIColor.clearColor().CGColor
            cell.User_Address.tintColor = UIColor.MKColor.Blue
            cell.User_Address.rippleLocation = .Right
            cell.User_Address.cornerRadius = 0
            cell.User_Address.bottomBorderEnabled = true
            
            cell.User_RealName.layer.borderColor = UIColor.clearColor().CGColor
            cell.User_RealName.tintColor = UIColor.MKColor.Blue
            cell.User_RealName.rippleLocation = .Right
            cell.User_RealName.cornerRadius = 0
            cell.User_RealName.bottomBorderEnabled = true
        }
        else{
            ProgressHUD.showError("连接超时")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    // MARK: - Table view data source


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
            return 1
        }
        if(section == 1){
            return 4
        }

        else{
            return 0
        }
    }

}
