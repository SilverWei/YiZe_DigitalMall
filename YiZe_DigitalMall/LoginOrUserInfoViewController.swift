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

    }

    func Monitoringloginstatus(){
        if(1 == 0){
            LoginView.hidden = true
            UserInfoView.hidden = false
        }
        else{
            LoginView.hidden = false
            UserInfoView.hidden = true
        }
    }
    
    @IBAction func LoginAfter(segue:UIStoryboardSegue){
        
        LoginView.hidden = true
        UserInfoView.hidden = false

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
