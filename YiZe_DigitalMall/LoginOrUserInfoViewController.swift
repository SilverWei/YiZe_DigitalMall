//
//  LoginOrUserInfoViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class LoginOrUserInfoViewController: UIViewController {

    @IBOutlet weak var LoginView: UIView!
    @IBOutlet weak var UserInfoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Monitoringloginstatus()
        //建立刷新通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotif:", name: "LoginOrUserInfo", object: nil)

    }

    func receivedNotif(notification:NSNotification){
        Monitoringloginstatus()
    }
    
    func Monitoringloginstatus(){
        if (NSUserDefaults.standardUserDefaults().valueForKey("UserID") != nil){
            if((NSUserDefaults.standardUserDefaults().valueForKey("UserID")) as! String != ""){
                LoginView.hidden = true
                UserInfoView.hidden = false
            }
            else
            {
                LoginView.hidden = false
                UserInfoView.hidden = true
            }
        }
        else{
            LoginView.hidden = false
            UserInfoView.hidden = true
        }
    }
    
    //登录按钮
    @IBAction func LoginAfter(segue:UIStoryboardSegue){
        
        let LoginView = segue.sourceViewController as! LoginViewController
        if(LoginView.UserNameText.text! == "" || LoginView.UserPasswordText.text! == ""){
            ProgressHUD.showError("用户名和密码不能为空")
        }
        else{
            let UserLoginOut = UserLogin(用户名: LoginView.UserNameText.text!, 密码: LoginView.UserPasswordText.text!)
            if(UserLoginOut != nil)
            {
                if(UserLoginOut?.Code == 0)
                {
                    ProgressHUD.showError("用户名或密码有误")
                }
                else if(UserLoginOut?.Code == 1)
                {
                    NSUserDefaults.standardUserDefaults().setObject(UserLoginOut?.User_ID, forKey: "UserID")
                    Monitoringloginstatus()
                    //调用通知
                    NSNotificationCenter.defaultCenter().postNotificationName("ReloadUserInfoView", object: nil)
                    
                    ProgressHUD.showSuccess("登录成功")
                }
                else
                {
                    ProgressHUD.showError("连接超时")
                }
            }
            else
            {
                ProgressHUD.showError("连接超时")
            }
        }

    }
    
    //注销按钮
    @IBAction func Logout(segue:UIStoryboardSegue){
        NSUserDefaults.standardUserDefaults().setObject("", forKey: "UserID")
        Monitoringloginstatus()
        ProgressHUD.showSuccess("注销完成")
    }
    
    @IBAction func CloseViewButton(segue:UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
