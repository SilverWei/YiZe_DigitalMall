//
//  SearchTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    @IBOutlet weak var SearchTextView: MKTextField!
    @IBOutlet var SearchTableView: UITableView!
    @IBOutlet var SortViewButton: UIBarButtonItem!
    @IBOutlet var SortSearchCloseButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchTextView.layer.borderColor = UIColor.clearColor().CGColor
        SearchTextView.placeholder = "搜索商品..."
        SearchTextView.backgroundColor = UIColor.grayColor()
        SearchTextView.tintColor = UIColor.whiteColor()
        
        //隐藏分类关闭按钮
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = SortViewButton
        
        //下拉刷新
        self.SearchTableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "print1")
        
        //建立刷新通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotif:", name: "SearchTabBarView", object: nil)
        
        
    }
    
    func receivedNotif(notification:NSNotification){
        SortSearchCome()
    }
    
    //显示分类搜索
    func SortSearchCome(){
        self.navigationItem.leftBarButtonItem = SortSearchCloseButton
    }
    
    func print1(){
        self.SearchTableView.header.endRefreshing()
    }

    @IBAction func SortSearchCloseButtonClick(sender: AnyObject) {
        self.navigationItem.leftBarButtonItem = SortViewButton
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }



}
