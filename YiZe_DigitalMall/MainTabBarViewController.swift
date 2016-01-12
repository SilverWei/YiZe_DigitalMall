//
//  MainTabBarViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/12.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //建立刷新通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotif:", name: "MainTabBarView", object: nil)
        
        
    }
    
    func receivedNotif(notification:NSNotification){
        self.selectedIndex = 1
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
