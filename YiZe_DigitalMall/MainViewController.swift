//
//  MainViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/8.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

@objc
protocol MainViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSUserDefaults.standardUserDefaults().setObject(0, forKey: "SortSelectTrue")
        
        //创建购物车唯一ID
        if(NSUserDefaults.standardUserDefaults().valueForKey("ShoppingCartUser_ID") == nil){
            let timeFormatter = NSDateFormatter()
            timeFormatter.dateFormat = "MMddHHmmssSSS"
            NSUserDefaults.standardUserDefaults().setObject(timeFormatter.stringFromDate(NSDate()) as String, forKey: "ShoppingCartUser_ID")
        }
    }

    @IBAction func MainViewContainer(segue:UIStoryboardSegue){
        delegate?.toggleLeftPanel?()
    }
    
    
    @IBAction func Sort2ndTableViewCellClick(segue:UIStoryboardSegue){
        delegate?.toggleLeftPanel?()
        NSNotificationCenter.defaultCenter().postNotificationName("MainTabBarView", object: nil)
        NSNotificationCenter.defaultCenter().postNotificationName("SearchTabBarView", object: nil)
        NSUserDefaults.standardUserDefaults().setObject(1, forKey: "SortSelectTrue")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
