//
//  MainTabBarViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/12.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    var HomeSearchName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //建立刷新通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotif:", name: "MainTabBarView", object: nil)
        
        
    }
    
    func receivedNotif(notification:NSNotification){
        self.selectedIndex = 1
    }
    
    
    @IBAction func HomeSearchButtonClick(segue:UIStoryboardSegue){
        
        NSUserDefaults.standardUserDefaults().setObject(HomeSearchName, forKey: "HomeSearchName")
        NSNotificationCenter.defaultCenter().postNotificationName("SearchTabBarView", object: nil)
        self.selectedIndex = 1
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
