//
//  HomeTableViewController.swift/Users/dmqlMAC/Documents/YiZe_DigitalMall/YiZe_DigitalMall/HomeViewController.swift
//  YiZe_DigitalMall
//
//  Created by dmqlMAC on 16/1/6.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit


class HomeTableViewController: UITableViewController {

    @IBOutlet weak var SearchTextView: MKTextField!
    @IBOutlet var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchTextView.layer.borderColor = UIColor.clearColor().CGColor
        SearchTextView.placeholder = "搜索商品..."
        SearchTextView.backgroundColor = UIColor.grayColor()
        SearchTextView.tintColor = UIColor.whiteColor()

        
        
        //下拉刷新
        self.HomeTableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "print1")
        
    }
    
    func print1(){
        self.HomeTableView.header.endRefreshing()
    }

    //上拉隐藏navigationBar动画
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if(velocity.y > 0.0)
        {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        else
        {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
}

