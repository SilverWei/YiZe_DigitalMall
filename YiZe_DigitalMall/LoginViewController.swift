//
//  LoginViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var UserNameText: MKTextField!
    @IBOutlet var UserPasswordText: MKTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UserNameText.layer.borderColor = UIColor.clearColor().CGColor
        UserNameText.floatingPlaceholderEnabled = true
        UserNameText.placeholder = "用户名"
        UserNameText.tintColor = UIColor.MKColor.Blue
        UserNameText.rippleLocation = .Right
        UserNameText.cornerRadius = 0
        UserNameText.bottomBorderEnabled = true
        
        UserPasswordText.layer.borderColor = UIColor.clearColor().CGColor
        UserPasswordText.floatingPlaceholderEnabled = true
        UserPasswordText.placeholder = "密码"
        UserPasswordText.tintColor = UIColor.MKColor.Blue
        UserPasswordText.rippleLocation = .Right
        UserPasswordText.cornerRadius = 0
        UserPasswordText.bottomBorderEnabled = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //收起键盘
        UserNameText.resignFirstResponder()
        UserPasswordText.resignFirstResponder()
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
